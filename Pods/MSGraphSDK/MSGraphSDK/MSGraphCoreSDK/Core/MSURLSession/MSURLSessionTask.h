// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

@class ODataBaseClient;

#import <Foundation/Foundation.h>
#import "MSHttpProvider.h"

/**
 States for the MSURLSessionTask.
 */
typedef NS_ENUM(NSInteger, MSURLSessionTaskState){
    MSURLSessionTaskStateTaskCreated = 0,
    MSURLSessionTaskStateTaskCanceled,
    MSURLSessionTaskStateTaskAuthenticating,
    MSURLSessionTaskStateTaskAuthFailed,
    MSURLSessionTaskStateTaskExecuting,
    MSURLSessionTaskStateTaskCompleted
};

/**
 The Upload Completion Handler to be called when an upload is completed.
 */
typedef void (^MSUploadCompletionHandler)(NSDictionary *response, NSError *error);

/**
 The download completion handler to be called when a download is completed.
 */
typedef MSRawDownloadCompletionHandler MSDownloadCompletionHandler;


@interface MSURLSessionTask : NSObject

/**
 The NSURLSessionTask that is created and used to make the actual request.
 This may be nil until the inner task is actually created.
 */
@property (readonly) NSURLSessionTask *innerTask;

/**
 The client that sends the request.
 */
@property (strong) ODataBaseClient *client;

/**
 The state of the task.
 @see MSURLSessionTaskState
 */
@property (readonly) MSURLSessionTaskState state;

/**
 Creates an `MSURLSessionTask` with the given requests and client.
 @param request The request to use. Must not be nil.
 @param client The client to make the request. Must not be nil.
 */
- (instancetype)initWithRequest:(NSMutableURLRequest *)request client:(ODataBaseClient *)client;

/**
 Executes the task.
 @warning The task may send an extra request to reauthenticate the session if the auth token has expired.
 */
- (void)execute;

/**
 Cancels the task.
 */
- (void)cancel;

@end
