// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphGroupConversationsCollectionRequest, MSGraphConversationRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphGroupConversationsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupConversationsCollectionRequest *)request;

- (MSGraphGroupConversationsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphConversationRequestBuilder *)conversation:(NSString *)conversation;


@end
