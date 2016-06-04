// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphEmailAddress()
{
    NSString* _name;
    NSString* _address;
}
@end

@implementation MSGraphEmailAddress

- (NSString*) name
{
    return self.dictionary[@"name"];
}
- (void) setName: (NSString*) val
{
    self.dictionary[@"name"] = val;
}
- (NSString*) address
{
    return self.dictionary[@"address"];
}
- (void) setAddress: (NSString*) val
{
    self.dictionary[@"address"] = val;
}
@end
