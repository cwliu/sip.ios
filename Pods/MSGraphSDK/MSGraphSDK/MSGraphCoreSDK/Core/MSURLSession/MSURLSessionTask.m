// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSURLSessionTask.h"
#import "ODataBaseClient.h"
#import "MSConstants.h"

@interface MSURLSessionTask()

@property (readonly) NSMutableURLRequest *request;

@end

@implementation MSURLSessionTask

- (instancetype)initWithRequest:(NSMutableURLRequest *)request
                         client:(ODataBaseClient *)client
{
    NSParameterAssert(request);
    NSParameterAssert(client);
    
    self = [super init];
    if (self){
        _client = client;
        _request = request;
        _state = MSURLSessionTaskStateTaskCreated;
    }
    return self;
}

- (void)execute;
{
    _state = MSURLSessionTaskStateTaskAuthenticating;
    
    //If no Content-Type is set, use text/plain
    
    if([self.request valueForHTTPHeaderField:@"Content-Type"]==nil)
    {
        [self.request setValue:@"text/plain" forHTTPHeaderField:@"Content-Type"];
    }
    
    [self.client.authenticationProvider appendAuthenticationHeaders:self.request completion:^(NSMutableURLRequest *request, NSError *error){
        if (self.state != MSURLSessionTaskStateTaskCanceled){
            if (!error){
                _state = MSURLSessionTaskStateTaskExecuting;
                _innerTask = [self taskWithRequest:request];
                [self.client.logger logWithLevel:MSLogLevelLogInfo message:@"Created NSURLSessionTask"];
                [self.client.logger logWithLevel:MSLogLevelLogVerbose message:@"Task Id : %ld", _innerTask.taskIdentifier];
                [_innerTask resume];
            }
            else{
                _state = MSURLSessionTaskStateTaskAuthFailed;
                [self.client.logger logWithLevel:MSLogLevelLogError message:@"Authentication Failed with error :%@", error];
                [self authenticationFailedWithError:error];
            }
        }
    }];
}

- (void)cancel
{
    [self.client.logger logWithLevel:MSLogLevelLogInfo message:@"Canceled task"];
    if (_innerTask){
        [self.client.logger logWithLevel:MSLogLevelLogDebug message:@"inner task : %l", [_innerTask taskIdentifier]];
        [_innerTask cancel];
    }
    _state = MSURLSessionTaskStateTaskCanceled;
}

- (NSURLSessionTask *)taskWithRequest:(NSMutableURLRequest *)request
{
    NSAssert(NO, @"Not Implemented, must implement in sub class");
    return nil;
}

- (void)authenticationFailedWithError:(NSError *)authError
{
    NSAssert(NO, @"Not Implemented, must implement in sub class");
}

@end
