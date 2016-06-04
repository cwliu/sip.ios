// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphMailFolder()
{
    NSString* _displayName;
    NSString* _parentFolderId;
    int32_t _childFolderCount;
    int32_t _unreadItemCount;
    int32_t _totalItemCount;
    NSArray* _messages;
    NSArray* _childFolders;
}
@end

@implementation MSGraphMailFolder

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.mailFolder";
    }
    return self;
}
- (NSString*) displayName
{
    return self.dictionary[@"displayName"];
}
- (void) setDisplayName: (NSString*) val
{
    self.dictionary[@"displayName"] = val;
}
- (NSString*) parentFolderId
{
    return self.dictionary[@"parentFolderId"];
}
- (void) setParentFolderId: (NSString*) val
{
    self.dictionary[@"parentFolderId"] = val;
}
- (int32_t) childFolderCount
{
    _childFolderCount = [self.dictionary[@"childFolderCount"] intValue];
    return _childFolderCount;
}
- (void) setChildFolderCount: (int32_t) val
{
    _childFolderCount = val;
    self.dictionary[@"childFolderCount"] = @(val);
}
- (int32_t) unreadItemCount
{
    _unreadItemCount = [self.dictionary[@"unreadItemCount"] intValue];
    return _unreadItemCount;
}
- (void) setUnreadItemCount: (int32_t) val
{
    _unreadItemCount = val;
    self.dictionary[@"unreadItemCount"] = @(val);
}
- (int32_t) totalItemCount
{
    _totalItemCount = [self.dictionary[@"totalItemCount"] intValue];
    return _totalItemCount;
}
- (void) setTotalItemCount: (int32_t) val
{
    _totalItemCount = val;
    self.dictionary[@"totalItemCount"] = @(val);
}
- (NSArray*) messages
{
    if(!_messages){
        
    NSMutableArray *messagesResult = [NSMutableArray array];
    NSArray *messages = self.dictionary[@"messages"];

    if ([messages isKindOfClass:[NSArray class]]){
        for (id message in messages){
            [messagesResult addObject:[[MSGraphMessage alloc] initWithDictionary: message]];
        }
    }

    _messages = messagesResult;
        
    }
    return _messages;
}
- (void) setMessages: (NSArray*) val
{
    _messages = val;
    self.dictionary[@"messages"] = val;
}
- (NSArray*) childFolders
{
    if(!_childFolders){
        
    NSMutableArray *childFoldersResult = [NSMutableArray array];
    NSArray *childFolders = self.dictionary[@"childFolders"];

    if ([childFolders isKindOfClass:[NSArray class]]){
        for (id mailFolder in childFolders){
            [childFoldersResult addObject:[[MSGraphMailFolder alloc] initWithDictionary: mailFolder]];
        }
    }

    _childFolders = childFoldersResult;
        
    }
    return _childFolders;
}
- (void) setChildFolders: (NSArray*) val
{
    _childFolders = val;
    self.dictionary[@"childFolders"] = val;
}
- (MSGraphMessage*) messages:(NSInteger)index
{
   MSGraphMessage* messages = nil;
   if (self.messages) {
       messages = self.messages[index];
   }
   return messages;
}

@end
