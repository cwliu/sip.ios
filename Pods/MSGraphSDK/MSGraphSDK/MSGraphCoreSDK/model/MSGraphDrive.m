// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphDrive()
{
    NSString* _driveType;
    MSGraphIdentitySet* _owner;
    MSGraphQuota* _quota;
    NSArray* _items;
    NSArray* _special;
    MSGraphDriveItem* _root;
}
@end

@implementation MSGraphDrive

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.drive";
    }
    return self;
}
- (NSString*) driveType
{
    return self.dictionary[@"driveType"];
}
- (void) setDriveType: (NSString*) val
{
    self.dictionary[@"driveType"] = val;
}
- (MSGraphIdentitySet*) owner
{
    if(!_owner){
        _owner = [[MSGraphIdentitySet alloc] initWithDictionary: self.dictionary[@"owner"]];
    }
    return _owner;
}
- (void) setOwner: (MSGraphIdentitySet*) val
{
    _owner = val;
    self.dictionary[@"owner"] = val;
}
- (MSGraphQuota*) quota
{
    if(!_quota){
        _quota = [[MSGraphQuota alloc] initWithDictionary: self.dictionary[@"quota"]];
    }
    return _quota;
}
- (void) setQuota: (MSGraphQuota*) val
{
    _quota = val;
    self.dictionary[@"quota"] = val;
}
- (NSArray*) items
{
    if(!_items){
        
    NSMutableArray *itemsResult = [NSMutableArray array];
    NSArray *items = self.dictionary[@"items"];

    if ([items isKindOfClass:[NSArray class]]){
        for (id driveItem in items){
            [itemsResult addObject:[[MSGraphDriveItem alloc] initWithDictionary: driveItem]];
        }
    }

    _items = itemsResult;
        
    }
    return _items;
}
- (void) setItems: (NSArray*) val
{
    _items = val;
    self.dictionary[@"items"] = val;
}
- (NSArray*) special
{
    if(!_special){
        
    NSMutableArray *specialResult = [NSMutableArray array];
    NSArray *special = self.dictionary[@"special"];

    if ([special isKindOfClass:[NSArray class]]){
        for (id driveItem in special){
            [specialResult addObject:[[MSGraphDriveItem alloc] initWithDictionary: driveItem]];
        }
    }

    _special = specialResult;
        
    }
    return _special;
}
- (void) setSpecial: (NSArray*) val
{
    _special = val;
    self.dictionary[@"special"] = val;
}
- (MSGraphDriveItem*) root
{
    if(!_root){
        _root = [[MSGraphDriveItem alloc] initWithDictionary: self.dictionary[@"root"]];
    }
    return _root;
}
- (void) setRoot: (MSGraphDriveItem*) val
{
    _root = val;
    self.dictionary[@"root"] = val;
}

@end
