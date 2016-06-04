// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphMessageCreateReplyAllRequest;

@interface MSGraphMessageCreateReplyAllRequestBuilder : MSRequestBuilder

- (MSGraphMessageCreateReplyAllRequest *)request;

- (MSGraphMessageCreateReplyAllRequest *)requestWithOptions:(NSArray *)options;

@end
