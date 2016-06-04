// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphConversationThreadRequest, MSGraphPostRequestBuilder, MSGraphConversationThreadPostsCollectionRequestBuilder, MSGraphConversationThreadReplyRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphEntityRequestBuilder.h"


@interface MSGraphConversationThreadRequestBuilder : MSGraphEntityRequestBuilder

- (MSGraphConversationThreadPostsCollectionRequestBuilder *)posts;

- (MSGraphPostRequestBuilder *)posts:(NSString *)post;

- (MSGraphConversationThreadReplyRequestBuilder *)replyWithPost:(MSGraphPost *)post ;




- (MSGraphConversationThreadRequest *) request;

- (MSGraphConversationThreadRequest *) requestWithOptions:(NSArray *)options;


@end
