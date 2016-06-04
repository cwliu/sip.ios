// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphItemReference()
{
    NSString* _driveId;
    NSString* _itemReferenceId;
    NSString* _path;
}
@end

@implementation MSGraphItemReference

- (NSString*) driveId
{
    return self.dictionary[@"driveId"];
}
- (void) setDriveId: (NSString*) val
{
    self.dictionary[@"driveId"] = val;
}
- (NSString*) itemReferenceId
{
    return self.dictionary[@"id"];
}
- (void) setItemReferenceId: (NSString*) val
{
    self.dictionary[@"id"] = val;
}
- (NSString*) path
{
    return self.dictionary[@"path"];
}
- (void) setPath: (NSString*) val
{
    self.dictionary[@"path"] = val;
}
@end
