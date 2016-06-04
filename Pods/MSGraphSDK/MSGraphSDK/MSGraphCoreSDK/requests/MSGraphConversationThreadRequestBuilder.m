// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphConversationThreadRequestBuilder

- (MSGraphConversationThreadPostsCollectionRequestBuilder *)posts
{
    return [[MSGraphConversationThreadPostsCollectionRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"posts"]  
                                                                                client:self.client];
}

- (MSGraphPostRequestBuilder *)posts:(NSString *)post
{
    return [[self posts] post:post];
}

- (MSGraphConversationThreadReplyRequestBuilder *)replyWithPost:(MSGraphPost *)post 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.reply"];
    return [[MSGraphConversationThreadReplyRequestBuilder alloc] initWithPost:post
                                                                          URL:actionURL
                                                                       client:self.client];


}


- (MSGraphConversationThreadRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphConversationThreadRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphConversationThreadRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
