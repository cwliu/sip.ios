// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphLocation()
{
    NSString* _displayName;
    MSGraphPhysicalAddress* _address;
}
@end

@implementation MSGraphLocation

- (NSString*) displayName
{
    return self.dictionary[@"displayName"];
}
- (void) setDisplayName: (NSString*) val
{
    self.dictionary[@"displayName"] = val;
}
- (MSGraphPhysicalAddress*) address
{
    if(!_address){
        _address = [[MSGraphPhysicalAddress alloc] initWithDictionary: self.dictionary[@"address"]];
    }
    return _address;
}
- (void) setAddress: (MSGraphPhysicalAddress*) val
{
    _address = val;
    self.dictionary[@"address"] = val;
}
@end
