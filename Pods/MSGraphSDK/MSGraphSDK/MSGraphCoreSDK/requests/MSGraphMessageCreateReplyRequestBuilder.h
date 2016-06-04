// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphMessageCreateReplyRequest;

@interface MSGraphMessageCreateReplyRequestBuilder : MSRequestBuilder

- (MSGraphMessageCreateReplyRequest *)request;

- (MSGraphMessageCreateReplyRequest *)requestWithOptions:(NSArray *)options;

@end
