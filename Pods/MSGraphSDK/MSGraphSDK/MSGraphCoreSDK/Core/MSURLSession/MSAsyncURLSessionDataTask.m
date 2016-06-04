// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSAsyncURLSessionDataTask.h"
#import "MSURLSessionDataTask.h"
#import "MSURLSessionTask+Protected.h"
#import "ODataBaseClient.h"
#import "MSConstants.h"
#import "NSJSONSerialization+ResponseHelper.h"

@interface MSAsyncURLSessionDataTask()

@property (strong) MSAsyncActionCompletion asyncActionCompletion;

@property (strong) NSMutableURLRequest *monitorRequest;

@property (strong) MSURLSessionTask *monitorTask;

@end


@implementation MSAsyncURLSessionDataTask

- (instancetype)initWithRequest:(NSMutableURLRequest *)request client:(ODataBaseClient *)client completion:(MSAsyncActionCompletion)completionHandler
{
    self = [super initWithRequest:request client:client];
    if (self){
        _asyncActionCompletion = completionHandler;
        _progress = [NSProgress progressWithTotalUnitCount:100];
    }
    return self;
}

- (NSURLSessionDataTask *)taskWithRequest:(NSMutableURLRequest *)request
{
    NSParameterAssert(request);
    
    [request setValue:MSHeaderRespondAsync forHTTPHeaderField:MSHeaderPrefer];
    [request setValue:MSHeaderApplicationJson forHTTPHeaderField:MSHeaderContentType];
    
    return [self.client.httpProvider dataTaskWithRequest:request
                                       completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
                                      if (self.asyncActionCompletion){
                                          if (!error){
                                              // If there was a client error set it
                                              [NSJSONSerialization dictionaryWithResponse:response responseData:data error:&error];
                                          }
                                          [self onRequestStarted:response error:error];
                                      }
                                  }];
}

- (void)onRequestStarted:(NSURLResponse *)response
                   error:(NSError *)error
{
    if (error){
        self.asyncActionCompletion(nil, nil, error);
    }
    else {
         NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
         NSInteger statusCode = httpResponse.statusCode;
        if (statusCode ==  MSExpectedResponseCodesAccepted){
            NSString *locationHeader = httpResponse.allHeaderFields[MSHeaderLocation];
            NSURL *monitorURL = [NSURL URLWithString:locationHeader];
            self.monitorRequest = [NSMutableURLRequest requestWithURL:monitorURL
                                                           cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData
                                                       timeoutInterval:60];
            
            [self sendMonitorRequest:self.monitorRequest];
        }
        else {
            // If the response was not MSAccepted and unknown error occurred
            self.asyncActionCompletion(nil, nil, [NSError errorWithDomain:MSErrorDomain code:MSClientErrorCodeUnknownError userInfo:@{MSHttpFailingResponseKey : httpResponse}]);
        }
    }
}

- (void)sendMonitorRequest:(NSMutableURLRequest *)request;
{
    __block MSURLSessionDataTask *task = [[MSURLSessionDataTask alloc] initWithRequest:request client:self.client completion:^(NSDictionary *response, NSError *error){
        [self onMonitorRequestResponse:response httpResponse:(NSHTTPURLResponse *)task.innerTask.response error:error];
        // We must set task to nil to drop the retain count from above. The task matains a strong reference to this call back which holds
        // a refence to the asyncCompletionHandler which leads to a retain cycle.
        task = nil;
    }];
    [task execute];
}

- (void)onMonitorRequestResponse:(NSDictionary *)response
                    httpResponse:(NSHTTPURLResponse *)httpResponse
                           error:(NSError *)error
{
    MSAsyncOperationStatus *status = nil;
    if (!error){
        if (httpResponse.statusCode == MSExpectedResponseCodesOK){
            _state = MSURLSessionTaskStateTaskCompleted;
            self.progress.completedUnitCount = 100;
            // When an async action returns it will redirect to the final location
            self.asyncActionCompletion(response, nil, nil);
            self.asyncActionCompletion = nil;
        }
        else if (httpResponse.statusCode == MSExpectedResponseCodesAccepted){
//            status = [[MSAsyncOperationStatus alloc] initWithDictionary:response];
            [self.client.logger logWithLevel:MSLogLevelLogInfo message:@"Async Status = %@", status];
//            self.progress.completedUnitCount = status.percentageComplete;
            self.asyncActionCompletion(nil, status, nil);
            // if the response was a valid status report send another one
            [self sendMonitorRequest:self.monitorRequest];
        }
        else {
            NSError *unknownError = [NSError errorWithDomain:MSErrorDomain code:MSClientErrorCodeUnknownError userInfo:@{MSHttpFailingResponseKey : httpResponse }];
            self.asyncActionCompletion(nil, nil, unknownError);
            self.asyncActionCompletion = nil;
        }
    }
    else {
        self.asyncActionCompletion(nil, nil, error);
        self.asyncActionCompletion = nil;
    }
}

@end

