// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphContactFolder()
{
    NSString* _parentFolderId;
    NSString* _displayName;
    NSArray* _contacts;
    NSArray* _childFolders;
}
@end

@implementation MSGraphContactFolder

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.contactFolder";
    }
    return self;
}
- (NSString*) parentFolderId
{
    return self.dictionary[@"parentFolderId"];
}
- (void) setParentFolderId: (NSString*) val
{
    self.dictionary[@"parentFolderId"] = val;
}
- (NSString*) displayName
{
    return self.dictionary[@"displayName"];
}
- (void) setDisplayName: (NSString*) val
{
    self.dictionary[@"displayName"] = val;
}
- (NSArray*) contacts
{
    if(!_contacts){
        
    NSMutableArray *contactsResult = [NSMutableArray array];
    NSArray *contacts = self.dictionary[@"contacts"];

    if ([contacts isKindOfClass:[NSArray class]]){
        for (id contact in contacts){
            [contactsResult addObject:[[MSGraphContact alloc] initWithDictionary: contact]];
        }
    }

    _contacts = contactsResult;
        
    }
    return _contacts;
}
- (void) setContacts: (NSArray*) val
{
    _contacts = val;
    self.dictionary[@"contacts"] = val;
}
- (NSArray*) childFolders
{
    if(!_childFolders){
        
    NSMutableArray *childFoldersResult = [NSMutableArray array];
    NSArray *childFolders = self.dictionary[@"childFolders"];

    if ([childFolders isKindOfClass:[NSArray class]]){
        for (id contactFolder in childFolders){
            [childFoldersResult addObject:[[MSGraphContactFolder alloc] initWithDictionary: contactFolder]];
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

@end
