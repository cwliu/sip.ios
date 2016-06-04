// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphConversationRequest, MSGraphConversationThreadRequestBuilder, MSGraphConversationThreadsCollectionRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphEntityRequestBuilder.h"


@interface MSGraphConversationRequestBuilder : MSGraphEntityRequestBuilder

- (MSGraphConversationThreadsCollectionRequestBuilder *)threads;

- (MSGraphConversationThreadRequestBuilder *)threads:(NSString *)conversationThread;


- (MSGraphConversationRequest *) request;

- (MSGraphConversationRequest *) requestWithOptions:(NSArray *)options;


@end
