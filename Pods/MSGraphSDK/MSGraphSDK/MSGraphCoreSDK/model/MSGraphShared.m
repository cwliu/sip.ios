// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphShared()
{
    MSGraphIdentitySet* _owner;
    NSString* _scope;
}
@end

@implementation MSGraphShared

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
- (NSString*) scope
{
    return self.dictionary[@"scope"];
}
- (void) setScope: (NSString*) val
{
    self.dictionary[@"scope"] = val;
}
@end
