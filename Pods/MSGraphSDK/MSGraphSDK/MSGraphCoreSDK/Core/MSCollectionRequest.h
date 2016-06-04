// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

@class MSCollection;

#import "MSRequest.h"

/**
 An `MSRequest` that is used to make collection requests from the service.
 */
@interface MSCollectionRequest : MSRequest

/**
 Creates an `MSURLSessionDataTask` with the given requests.
 @param request The request to create the task with.
 @param castBlock A block that will convert a response dictionary to an `MSCollection`.
 @param completionHandler The completion handler to be called when the request is complete.
 */
- (MSURLSessionDataTask *)collectionTaskWithRequest:(NSMutableURLRequest *)request
                             odObjectWithDictionary:(MSObject* (^)(NSDictionary *response))castBlock
                                         completion:(void (^)(MSCollection *response, NSError *error))completionHandler;

@end
