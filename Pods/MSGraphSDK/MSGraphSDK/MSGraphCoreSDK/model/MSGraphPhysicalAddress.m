// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphPhysicalAddress()
{
    NSString* _street;
    NSString* _city;
    NSString* _state;
    NSString* _countryOrRegion;
    NSString* _postalCode;
}
@end

@implementation MSGraphPhysicalAddress

- (NSString*) street
{
    return self.dictionary[@"street"];
}
- (void) setStreet: (NSString*) val
{
    self.dictionary[@"street"] = val;
}
- (NSString*) city
{
    return self.dictionary[@"city"];
}
- (void) setCity: (NSString*) val
{
    self.dictionary[@"city"] = val;
}
- (NSString*) state
{
    return self.dictionary[@"state"];
}
- (void) setState: (NSString*) val
{
    self.dictionary[@"state"] = val;
}
- (NSString*) countryOrRegion
{
    return self.dictionary[@"countryOrRegion"];
}
- (void) setCountryOrRegion: (NSString*) val
{
    self.dictionary[@"countryOrRegion"] = val;
}
- (NSString*) postalCode
{
    return self.dictionary[@"postalCode"];
}
- (void) setPostalCode: (NSString*) val
{
    self.dictionary[@"postalCode"] = val;
}
@end
