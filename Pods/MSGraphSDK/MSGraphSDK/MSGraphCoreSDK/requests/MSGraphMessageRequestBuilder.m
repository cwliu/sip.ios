// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphMessageRequestBuilder

- (MSGraphMessageAttachmentsCollectionRequestBuilder *)attachments
{
    return [[MSGraphMessageAttachmentsCollectionRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"attachments"]  
                                                                           client:self.client];
}

- (MSGraphAttachmentRequestBuilder *)attachments:(NSString *)attachment
{
    return [[self attachments] attachment:attachment];
}

- (MSGraphMessageCopyRequestBuilder *)copyWithDestinationId:(NSString *)destinationId 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.copy"];
    return [[MSGraphMessageCopyRequestBuilder alloc] initWithDestinationId:destinationId
                                                                       URL:actionURL
                                                                    client:self.client];


}

- (MSGraphMessageMoveRequestBuilder *)moveWithDestinationId:(NSString *)destinationId 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.move"];
    return [[MSGraphMessageMoveRequestBuilder alloc] initWithDestinationId:destinationId
                                                                       URL:actionURL
                                                                    client:self.client];


}

- (MSGraphMessageCreateReplyRequestBuilder *)createReply
{
    return [[MSGraphMessageCreateReplyRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"microsoft.graph.createReply"] client:self.client];
}

- (MSGraphMessageCreateReplyAllRequestBuilder *)createReplyAll
{
    return [[MSGraphMessageCreateReplyAllRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"microsoft.graph.createReplyAll"] client:self.client];
}

- (MSGraphMessageCreateForwardRequestBuilder *)createForward
{
    return [[MSGraphMessageCreateForwardRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"microsoft.graph.createForward"] client:self.client];
}

- (MSGraphMessageReplyRequestBuilder *)replyWithComment:(NSString *)comment 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.reply"];
    return [[MSGraphMessageReplyRequestBuilder alloc] initWithComment:comment
                                                                  URL:actionURL
                                                               client:self.client];


}

- (MSGraphMessageReplyAllRequestBuilder *)replyAllWithComment:(NSString *)comment 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.replyAll"];
    return [[MSGraphMessageReplyAllRequestBuilder alloc] initWithComment:comment
                                                                     URL:actionURL
                                                                  client:self.client];


}

- (MSGraphMessageForwardRequestBuilder *)forwardWithComment:(NSString *)comment toRecipients:(NSArray *)toRecipients 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.forward"];
    return [[MSGraphMessageForwardRequestBuilder alloc] initWithComment:comment
                                                           toRecipients:toRecipients
                                                                    URL:actionURL
                                                                 client:self.client];


}

- (MSGraphMessageSendRequestBuilder *)send
{
    return [[MSGraphMessageSendRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"microsoft.graph.send"] client:self.client];
}


- (MSGraphMessageRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphMessageRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphMessageRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
