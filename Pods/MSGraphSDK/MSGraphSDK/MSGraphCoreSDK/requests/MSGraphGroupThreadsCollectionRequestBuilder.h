// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphGroupThreadsCollectionRequest, MSGraphConversationThreadRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphGroupThreadsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupThreadsCollectionRequest *)request;

- (MSGraphGroupThreadsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphConversationThreadRequestBuilder *)conversationThread:(NSString *)conversationThread;


@end
