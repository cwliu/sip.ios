// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphDriveRecipient()
{
    NSString* _email;
    NSString* _alias;
    NSString* _objectId;
}
@end

@implementation MSGraphDriveRecipient

- (NSString*) email
{
    return self.dictionary[@"email"];
}
- (void) setEmail: (NSString*) val
{
    self.dictionary[@"email"] = val;
}
- (NSString*) alias
{
    return self.dictionary[@"alias"];
}
- (void) setAlias: (NSString*) val
{
    self.dictionary[@"alias"] = val;
}
- (NSString*) objectId
{
    return self.dictionary[@"objectId"];
}
- (void) setObjectId: (NSString*) val
{
    self.dictionary[@"objectId"] = val;
}
@end
