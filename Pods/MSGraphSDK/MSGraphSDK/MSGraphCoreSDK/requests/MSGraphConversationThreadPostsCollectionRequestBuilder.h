// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphConversationThreadPostsCollectionRequest, MSGraphPostRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphConversationThreadPostsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphConversationThreadPostsCollectionRequest *)request;

- (MSGraphConversationThreadPostsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphPostRequestBuilder *)post:(NSString *)post;


@end
