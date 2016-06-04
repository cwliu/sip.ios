// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphPostRequestBuilder

-(MSGraphPostRequestBuilder *)inReplyTo
{
    return [[MSGraphPostRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"inReplyTo"] client:self.client];

}

- (MSGraphPostAttachmentsCollectionRequestBuilder *)attachments
{
    return [[MSGraphPostAttachmentsCollectionRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"attachments"]  
                                                                        client:self.client];
}

- (MSGraphAttachmentRequestBuilder *)attachments:(NSString *)attachment
{
    return [[self attachments] attachment:attachment];
}

- (MSGraphPostForwardRequestBuilder *)forwardWithComment:(NSString *)comment toRecipients:(NSArray *)toRecipients 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.forward"];
    return [[MSGraphPostForwardRequestBuilder alloc] initWithComment:comment
                                                        toRecipients:toRecipients
                                                                 URL:actionURL
                                                              client:self.client];


}

- (MSGraphPostReplyRequestBuilder *)replyWithPost:(MSGraphPost *)post 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.reply"];
    return [[MSGraphPostReplyRequestBuilder alloc] initWithPost:post
                                                            URL:actionURL
                                                         client:self.client];


}


- (MSGraphPostRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphPostRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphPostRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
