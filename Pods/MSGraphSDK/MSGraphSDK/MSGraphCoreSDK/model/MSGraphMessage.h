// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphItemBody, MSGraphRecipient, MSGraphAttachment; 
#import "MSGraphImportance.h"


#import "MSGraphOutlookItem.h"

@interface MSGraphMessage : MSGraphOutlookItem

  @property (nonatomic, setter=setReceivedDateTime:, getter=receivedDateTime) NSDate* receivedDateTime;
    @property (nonatomic, setter=setSentDateTime:, getter=sentDateTime) NSDate* sentDateTime;
    @property (nonatomic, setter=setHasAttachments:, getter=hasAttachments) BOOL hasAttachments;
    @property (nonatomic, setter=setInternetMessageId:, getter=internetMessageId) NSString* internetMessageId;
    @property (nonatomic, setter=setSubject:, getter=subject) NSString* subject;
    @property (nonatomic, setter=setBody:, getter=body) MSGraphItemBody* body;
    @property (nonatomic, setter=setBodyPreview:, getter=bodyPreview) NSString* bodyPreview;
    @property (nonatomic, setter=setImportance:, getter=importance) MSGraphImportance* importance;
    @property (nonatomic, setter=setParentFolderId:, getter=parentFolderId) NSString* parentFolderId;
    @property (nonatomic, setter=setSender:, getter=sender) MSGraphRecipient* sender;
    @property (nonatomic, setter=setFrom:, getter=from) MSGraphRecipient* from;
    @property (nonatomic, setter=setToRecipients:, getter=toRecipients) NSArray* toRecipients;
    @property (nonatomic, setter=setCcRecipients:, getter=ccRecipients) NSArray* ccRecipients;
    @property (nonatomic, setter=setBccRecipients:, getter=bccRecipients) NSArray* bccRecipients;
    @property (nonatomic, setter=setReplyTo:, getter=replyTo) NSArray* replyTo;
    @property (nonatomic, setter=setConversationId:, getter=conversationId) NSString* conversationId;
    @property (nonatomic, setter=setUniqueBody:, getter=uniqueBody) MSGraphItemBody* uniqueBody;
    @property (nonatomic, setter=setIsDeliveryReceiptRequested:, getter=isDeliveryReceiptRequested) BOOL isDeliveryReceiptRequested;
    @property (nonatomic, setter=setIsReadReceiptRequested:, getter=isReadReceiptRequested) BOOL isReadReceiptRequested;
    @property (nonatomic, setter=setIsRead:, getter=isRead) BOOL isRead;
    @property (nonatomic, setter=setIsDraft:, getter=isDraft) BOOL isDraft;
    @property (nonatomic, setter=setWebLink:, getter=webLink) NSString* webLink;
    @property (nonatomic, setter=setAttachments:, getter=attachments) NSArray* attachments;
  
@end
