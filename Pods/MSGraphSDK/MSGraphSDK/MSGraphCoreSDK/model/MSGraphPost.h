// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphItemBody, MSGraphRecipient, MSGraphAttachment; 


#import "MSGraphOutlookItem.h"

@interface MSGraphPost : MSGraphOutlookItem

  @property (nonatomic, setter=setBody:, getter=body) MSGraphItemBody* body;
    @property (nonatomic, setter=setReceivedDateTime:, getter=receivedDateTime) NSDate* receivedDateTime;
    @property (nonatomic, setter=setHasAttachments:, getter=hasAttachments) BOOL hasAttachments;
    @property (nonatomic, setter=setFrom:, getter=from) MSGraphRecipient* from;
    @property (nonatomic, setter=setSender:, getter=sender) MSGraphRecipient* sender;
    @property (nonatomic, setter=setConversationThreadId:, getter=conversationThreadId) NSString* conversationThreadId;
    @property (nonatomic, setter=setNewParticipants:, getter=getNewParticipants) NSArray* newParticipants;
    @property (nonatomic, setter=setConversationId:, getter=conversationId) NSString* conversationId;
    @property (nonatomic, setter=setInReplyTo:, getter=inReplyTo) MSGraphPost* inReplyTo;
    @property (nonatomic, setter=setAttachments:, getter=attachments) NSArray* attachments;
  
@end
