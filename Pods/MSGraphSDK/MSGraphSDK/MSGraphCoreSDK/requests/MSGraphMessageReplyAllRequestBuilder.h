// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphMessageReplyAllRequest;

@interface MSGraphMessageReplyAllRequestBuilder : MSRequestBuilder

- (instancetype)initWithComment:(NSString *)comment URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphMessageReplyAllRequest *)request;

- (MSGraphMessageReplyAllRequest *)requestWithOptions:(NSArray *)options;

@end
