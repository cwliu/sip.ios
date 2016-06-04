// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphConversationThreadsCollectionRequest, MSGraphConversationThreadRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphConversationThreadsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphConversationThreadsCollectionRequest *)request;

- (MSGraphConversationThreadsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphConversationThreadRequestBuilder *)conversationThread:(NSString *)conversationThread;


@end
