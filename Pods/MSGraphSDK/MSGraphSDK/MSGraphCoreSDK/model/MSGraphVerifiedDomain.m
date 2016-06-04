// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphVerifiedDomain()
{
    NSString* _capabilities;
    BOOL _isDefault;
    BOOL _isInitial;
    NSString* _name;
    NSString* _type;
}
@end

@implementation MSGraphVerifiedDomain

- (NSString*) capabilities
{
    return self.dictionary[@"capabilities"];
}
- (void) setCapabilities: (NSString*) val
{
    self.dictionary[@"capabilities"] = val;
}
- (BOOL) isDefault
{
    _isDefault = [self.dictionary[@"isDefault"] boolValue];
    return _isDefault;
}
- (void) setIsDefault: (BOOL) val
{
    _isDefault = val;
    self.dictionary[@"isDefault"] = @(val);
}
- (BOOL) isInitial
{
    _isInitial = [self.dictionary[@"isInitial"] boolValue];
    return _isInitial;
}
- (void) setIsInitial: (BOOL) val
{
    _isInitial = val;
    self.dictionary[@"isInitial"] = @(val);
}
- (NSString*) name
{
    return self.dictionary[@"name"];
}
- (void) setName: (NSString*) val
{
    self.dictionary[@"name"] = val;
}
- (NSString*) type
{
    return self.dictionary[@"type"];
}
- (void) setType: (NSString*) val
{
    self.dictionary[@"type"] = val;
}
@end
