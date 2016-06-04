// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphPostRequest, MSGraphPostRequestBuilder, MSGraphInReplyToRequestBuilder, MSGraphAttachmentRequestBuilder, MSGraphPostAttachmentsCollectionRequestBuilder, MSGraphPostForwardRequestBuilder, MSGraphPostReplyRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphOutlookItemRequestBuilder.h"


@interface MSGraphPostRequestBuilder : MSGraphOutlookItemRequestBuilder

- (MSGraphPostRequestBuilder *) inReplyTo;

- (MSGraphPostAttachmentsCollectionRequestBuilder *)attachments;

- (MSGraphAttachmentRequestBuilder *)attachments:(NSString *)attachment;

- (MSGraphPostForwardRequestBuilder *)forwardWithComment:(NSString *)comment toRecipients:(NSArray *)toRecipients ;



- (MSGraphPostReplyRequestBuilder *)replyWithPost:(MSGraphPost *)post ;




- (MSGraphPostRequest *) request;

- (MSGraphPostRequest *) requestWithOptions:(NSArray *)options;


@end
