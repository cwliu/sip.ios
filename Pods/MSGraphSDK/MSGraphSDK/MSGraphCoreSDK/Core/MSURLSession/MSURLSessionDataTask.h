// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSURLSessionTask.h"

/**
 An `MSURLSessionTask` to be used for retrieving data.
 @see MSURLSessionTask
 */
@interface MSURLSessionDataTask : MSURLSessionTask

/**
 Creates a Download task with the given request and client.
 @param request The mutableURL request. Must not be nil.
 @param client The client that will send the request. Must not be nil.
 @param completionHandler The completion handler to call when the task has completed.
 */
- (instancetype)initWithRequest:(NSMutableURLRequest *)request
                         client:(ODataBaseClient *)client
                     completion:(void (^)(NSDictionary *dictionary, NSError *error))completionHandler;

@end
