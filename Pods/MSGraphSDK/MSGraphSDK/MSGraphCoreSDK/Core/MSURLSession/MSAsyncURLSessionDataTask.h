// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

@class MSAsyncOperationStatus;

#import "MSURLSessionTask.h"

/**
 An `MSURLSessionTask` to be used for async tasks. These tasks will poll a monitor request in the background.
 As the monitor requests complete they will call the MSAsyncActionCompletionHandler, and only one of the parameters will be non nil at a time.
 */
@interface MSAsyncURLSessionDataTask : MSURLSessionTask

/**
 An NSProgress representing the progress of the async task.
 */
@property NSProgress *progress;

/**
 The Async Action Completion, to be called when the task is completed, has an updated monitor response, or if there was an error.
 */
typedef void(^MSAsyncActionCompletion)(id response, MSAsyncOperationStatus *status, NSError *error);

/**
 Creates an `MSAsyncURLSessionDataTask` with the given requests and client.
 @param request The request to use. Must not be nil.
 @param client The client to make the request. Must not be nil.
 @param completionHandler The completionHandler to be called whenever the task was completed, the status was updated, or there was an error.
 */
- (instancetype)initWithRequest:(NSMutableURLRequest *)request
                         client:(ODataBaseClient *)client
                     completion:(MSAsyncActionCompletion)completionHandler;

@end
