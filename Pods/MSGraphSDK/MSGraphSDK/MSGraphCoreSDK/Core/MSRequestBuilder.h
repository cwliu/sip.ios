// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import <Foundation/Foundation.h>
#import "MSHttpProvider.h"
#import "MSQueryParameters.h"
#import "MSHeaderOptions.h"

@class MSObject, ODataBaseClient;

/**
 The `MSRequestBuilder` constructs `MSRequest` objects from the given url and client.
 @see `MSItemRequestBuilder`
 */
@interface MSRequestBuilder : NSObject

/**
 The client used to create and send the `MSRequest`.
 */
@property (readonly) ODataBaseClient *client;

/**
 The url of the request.
 */
@property (readonly) NSURL *requestURL;

/**
 Creates an `MSRequestBuilder` with the given url and client.
 @param url The url of the request.
 @param client The client used to create and send the `MSRequest`.
 */
- (instancetype)initWithURL:(NSURL *)url client:(ODataBaseClient *)client;

@end
