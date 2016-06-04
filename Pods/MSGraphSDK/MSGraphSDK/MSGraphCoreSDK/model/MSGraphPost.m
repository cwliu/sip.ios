// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphPost()
{
    MSGraphItemBody* _body;
    NSDate* _receivedDateTime;
    BOOL _hasAttachments;
    MSGraphRecipient* _from;
    MSGraphRecipient* _sender;
    NSString* _conversationThreadId;
    NSArray* _newParticipants;
    NSString* _conversationId;
    MSGraphPost* _inReplyTo;
    NSArray* _attachments;
}
@end

@implementation MSGraphPost

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.post";
    }
    return self;
}
- (MSGraphItemBody*) body
{
    if(!_body){
        _body = [[MSGraphItemBody alloc] initWithDictionary: self.dictionary[@"body"]];
    }
    return _body;
}
- (void) setBody: (MSGraphItemBody*) val
{
    _body = val;
    self.dictionary[@"body"] = val;
}
- (NSDate*) receivedDateTime
{
    if(!_receivedDateTime){
        _receivedDateTime = [NSDate ms_dateFromString: self.dictionary[@"receivedDateTime"]];
    }
    return _receivedDateTime;
}
- (void) setReceivedDateTime: (NSDate*) val
{
    _receivedDateTime = val;
    self.dictionary[@"receivedDateTime"] = val;
}
- (BOOL) hasAttachments
{
    _hasAttachments = [self.dictionary[@"hasAttachments"] boolValue];
    return _hasAttachments;
}
- (void) setHasAttachments: (BOOL) val
{
    _hasAttachments = val;
    self.dictionary[@"hasAttachments"] = @(val);
}
- (MSGraphRecipient*) from
{
    if(!_from){
        _from = [[MSGraphRecipient alloc] initWithDictionary: self.dictionary[@"from"]];
    }
    return _from;
}
- (void) setFrom: (MSGraphRecipient*) val
{
    _from = val;
    self.dictionary[@"from"] = val;
}
- (MSGraphRecipient*) sender
{
    if(!_sender){
        _sender = [[MSGraphRecipient alloc] initWithDictionary: self.dictionary[@"sender"]];
    }
    return _sender;
}
- (void) setSender: (MSGraphRecipient*) val
{
    _sender = val;
    self.dictionary[@"sender"] = val;
}
- (NSString*) conversationThreadId
{
    return self.dictionary[@"conversationThreadId"];
}
- (void) setConversationThreadId: (NSString*) val
{
    self.dictionary[@"conversationThreadId"] = val;
}
- (NSArray*) getNewParticipants
{
    if(!_newParticipants){
        
    NSMutableArray *newParticipantsResult = [NSMutableArray array];
    NSArray *newParticipants = self.dictionary[@"newParticipants"];

    if ([newParticipants isKindOfClass:[NSArray class]]){
        for (id recipient in newParticipants){
            [newParticipantsResult addObject:[[MSGraphRecipient alloc] initWithDictionary: recipient]];
        }
    }

    _newParticipants = newParticipantsResult;
        
    }
    return _newParticipants;
}
- (void) setNewParticipants: (NSArray*) val
{
    _newParticipants = val;
    self.dictionary[@"newParticipants"] = val;
}
- (NSString*) conversationId
{
    return self.dictionary[@"conversationId"];
}
- (void) setConversationId: (NSString*) val
{
    self.dictionary[@"conversationId"] = val;
}
- (MSGraphPost*) inReplyTo
{
    if(!_inReplyTo){
        _inReplyTo = [[MSGraphPost alloc] initWithDictionary: self.dictionary[@"inReplyTo"]];
    }
    return _inReplyTo;
}
- (void) setInReplyTo: (MSGraphPost*) val
{
    _inReplyTo = val;
    self.dictionary[@"inReplyTo"] = val;
}
- (NSArray*) attachments
{
    if(!_attachments){
        
    NSMutableArray *attachmentsResult = [NSMutableArray array];
    NSArray *attachments = self.dictionary[@"attachments"];

    if ([attachments isKindOfClass:[NSArray class]]){
        for (id attachment in attachments){
            [attachmentsResult addObject:[[MSGraphAttachment alloc] initWithDictionary: attachment]];
        }
    }

    _attachments = attachmentsResult;
        
    }
    return _attachments;
}
- (void) setAttachments: (NSArray*) val
{
    _attachments = val;
    self.dictionary[@"attachments"] = val;
}

@end
