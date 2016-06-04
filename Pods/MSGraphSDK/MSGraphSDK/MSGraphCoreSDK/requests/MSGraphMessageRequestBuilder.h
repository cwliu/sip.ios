// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphMessageRequest, MSGraphAttachmentRequestBuilder, MSGraphMessageAttachmentsCollectionRequestBuilder, MSGraphMessageCopyRequestBuilder, MSGraphMessageMoveRequestBuilder, MSGraphMessageCreateReplyRequestBuilder, MSGraphMessageCreateReplyAllRequestBuilder, MSGraphMessageCreateForwardRequestBuilder, MSGraphMessageReplyRequestBuilder, MSGraphMessageReplyAllRequestBuilder, MSGraphMessageForwardRequestBuilder, MSGraphMessageSendRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphOutlookItemRequestBuilder.h"


@interface MSGraphMessageRequestBuilder : MSGraphOutlookItemRequestBuilder

- (MSGraphMessageAttachmentsCollectionRequestBuilder *)attachments;

- (MSGraphAttachmentRequestBuilder *)attachments:(NSString *)attachment;

- (MSGraphMessageCopyRequestBuilder *)copyWithDestinationId:(NSString *)destinationId ;



- (MSGraphMessageMoveRequestBuilder *)moveWithDestinationId:(NSString *)destinationId ;



- (MSGraphMessageCreateReplyRequestBuilder *)createReply;



- (MSGraphMessageCreateReplyAllRequestBuilder *)createReplyAll;



- (MSGraphMessageCreateForwardRequestBuilder *)createForward;



- (MSGraphMessageReplyRequestBuilder *)replyWithComment:(NSString *)comment ;



- (MSGraphMessageReplyAllRequestBuilder *)replyAllWithComment:(NSString *)comment ;



- (MSGraphMessageForwardRequestBuilder *)forwardWithComment:(NSString *)comment toRecipients:(NSArray *)toRecipients ;



- (MSGraphMessageSendRequestBuilder *)send;




- (MSGraphMessageRequest *) request;

- (MSGraphMessageRequest *) requestWithOptions:(NSArray *)options;


@end
