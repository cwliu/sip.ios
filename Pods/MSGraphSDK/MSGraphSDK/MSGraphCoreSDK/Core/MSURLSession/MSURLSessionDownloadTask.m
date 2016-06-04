// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSURLSessionDownloadTask.h"
#import "ODataBaseClient.h"
#import "MSURLSessionTask+Protected.h"
#import "NSJSONSerialization+ResponseHelper.h"
#import "MSConstants.h"

@interface MSURLSessionDownloadTask()

@property (strong) MSDownloadCompletionHandler completionHandler;

@end

@implementation MSURLSessionDownloadTask

- (instancetype)initWithRequest:(NSMutableURLRequest *)request
                         client:(ODataBaseClient *)client
             completionHandler:(MSDownloadCompletionHandler)completionHandler
{
    self = [super initWithRequest:request client:client];
    if (self){
        _completionHandler = completionHandler;
    }
    return self;
}

- (void)authenticationFailedWithError:(NSError *)authError
{
    if (self.completionHandler){
        self.completionHandler(nil, nil, authError);
    }
}

- (NSURLSessionDownloadTask *)taskWithRequest:(NSMutableURLRequest *)request
{
    [self.client.logger logWithLevel:MSLogLevelLogVerbose message:@"Creating download task with request : %@", request];
    NSProgress *progress = [self createProgress];
    return [self.client.httpProvider downloadTaskWithRequest:request progress:&progress completionHandler:^(NSURL *location, NSURLResponse *response, NSError *error){
        _state = MSURLSessionTaskStateTaskCompleted;
        NSInteger statusCode = ((NSHTTPURLResponse *)response).statusCode;
        [self.client.logger logWithLevel:MSLogLevelLogVerbose message:@"Received download response with http status code %ld", statusCode];
        if (!error && statusCode != MSExpectedResponseCodesOK) {
            // The only response that should allow for the binary data to be in the file is a 200, otherwise it will be empty (304 no body)
            // or contain the error json blob which will be passed back in the error object if it exists
            // because this is a download task it will download the response to disk instead of memory
            if ( statusCode != MSExpectedResponseCodesNotModified){
                error = [self readErrorFromFile:location response:response];
            }
            location = nil;
        }
        if (self.completionHandler){
            self.completionHandler(location, response, error);
        }
    }];
}

- (NSError *)readErrorFromFile:(NSURL *)fileLocation response:(NSURLResponse *)response
{
    NSError *error = nil;
    NSData *responseData = [NSData dataWithContentsOfURL:fileLocation options:0 error:&error];
    if (error){
        [self.client.logger logWithLevel:MSLogLevelLogWarn message:@"Failed to read error from file"];
        [self.client.logger logWithLevel:MSLogLevelLogDebug message:@"File read error : %@", responseData];
        // if we can't read the error form disk thats ok just created a malformed error down the line
        error = nil;
    }
    NSDictionary *responseObject = nil;
    if (responseData){
        responseObject = [NSJSONSerialization JSONObjectWithData:responseData options:0 error:&error];
        if (error){
            [self.client.logger logWithLevel:MSLogLevelLogWarn message:@"Error parsing error : %@", error];
        }
    }
    // If we couldn't parse the error object from the file still return an error with the proper code and no MSError
    return [NSJSONSerialization errorFromResponse:response responseObject:responseObject];
}

@end
