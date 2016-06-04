// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSURLSessionUploadTask.h"
#import "ODataBaseClient.h"
#import "MSURLSessionTask+Protected.h"
#import "NSJSONSerialization+ResponseHelper.h"

@interface MSURLSessionUploadTask()

@property NSURL *fileURL;

@property NSData *data;

@property (strong) MSUploadCompletionHandler completionHandler;

@end

@implementation MSURLSessionUploadTask

- (instancetype) initWithRequest:(NSMutableURLRequest *)request
                        fromFile:(NSURL *)fileURL
                          client:(ODataBaseClient *)client
               completionHandler:(MSUploadCompletionHandler)completionHandler
{
    NSParameterAssert(fileURL);
    
    self = [super initWithRequest:request client:client];
    if(self){
        _fileURL = fileURL;
        _completionHandler = completionHandler;
    }
    return self;
}

- (instancetype)initWithRequest:(NSMutableURLRequest *)request
                           data:(NSData *)data
                         client:(ODataBaseClient *)client
              completionHandler:(MSUploadCompletionHandler)completionHandler
{
    NSParameterAssert(data);
    
    self = [super initWithRequest:request client:client];
    if (self){
        _data = data;
        _completionHandler = completionHandler;
    }
    return self;
}

-(NSURLSessionUploadTask *)taskWithRequest:(NSMutableURLRequest *)request
{
    NSURLSessionUploadTask *uploadTask = nil;
    NSProgress *progress = [self createProgress];
    if (self.data){
        uploadTask = [self.client.httpProvider uploadTaskWithRequest:request fromData:self.data progress:&progress completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
            [self onCompletion:data response:response error:error];
        }];
    }
    else{
        uploadTask = [self.client.httpProvider uploadTaskWithRequest:request fromFile:self.fileURL progress:&progress completionHandler:^(NSData *data, NSURLResponse *response, NSError *error){
            [self onCompletion:data response:response error:error];
        }];
    }
    return uploadTask;
}

- (void)onCompletion:(NSData *)data response:(NSURLResponse *)response error:(NSError *)error
{
    _state = MSURLSessionTaskStateTaskCompleted;
    NSDictionary *responseDictionary = nil;
    if (!error){
        responseDictionary = [NSJSONSerialization dictionaryWithResponse:response responseData:data error:&error];
    }
    if (error){
        [self.client.logger logWithLevel:MSLogLevelLogError message:@"Error from download response %@", error];
        if (response){
            [self.client.logger logWithLevel:MSLogLevelLogDebug message:@"Error from response : %@", response];
        }
    }
    if (self.completionHandler){
        self.completionHandler(responseDictionary, error);
    }
}

- (void)authenticationFailedWithError:(NSError *)authError
{
    self.completionHandler(nil, authError);
}

@end
