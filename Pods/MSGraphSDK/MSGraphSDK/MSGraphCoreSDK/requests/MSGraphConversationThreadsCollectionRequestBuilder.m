// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphConversationThreadsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphConversationThreadsCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphConversationThreadsCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphConversationThreadsCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphConversationThreadRequestBuilder *)conversationThread:(NSString *)conversationThread
{
    return [[MSGraphConversationThreadRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:conversationThread]
                                                   client:self.client];
}

@end
