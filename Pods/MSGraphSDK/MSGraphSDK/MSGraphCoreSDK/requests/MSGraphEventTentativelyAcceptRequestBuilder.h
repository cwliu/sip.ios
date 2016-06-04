// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphEventTentativelyAcceptRequest;

@interface MSGraphEventTentativelyAcceptRequestBuilder : MSRequestBuilder

- (instancetype)initWithComment:(NSString *)comment sendResponse:(BOOL)sendResponse URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphEventTentativelyAcceptRequest *)request;

- (MSGraphEventTentativelyAcceptRequest *)requestWithOptions:(NSArray *)options;

@end
