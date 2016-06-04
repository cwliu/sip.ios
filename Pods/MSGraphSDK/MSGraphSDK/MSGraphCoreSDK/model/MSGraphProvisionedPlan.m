// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphProvisionedPlan()
{
    NSString* _capabilityStatus;
    NSString* _provisioningStatus;
    NSString* _service;
}
@end

@implementation MSGraphProvisionedPlan

- (NSString*) capabilityStatus
{
    return self.dictionary[@"capabilityStatus"];
}
- (void) setCapabilityStatus: (NSString*) val
{
    self.dictionary[@"capabilityStatus"] = val;
}
- (NSString*) provisioningStatus
{
    return self.dictionary[@"provisioningStatus"];
}
- (void) setProvisioningStatus: (NSString*) val
{
    self.dictionary[@"provisioningStatus"] = val;
}
- (NSString*) service
{
    return self.dictionary[@"service"];
}
- (void) setService: (NSString*) val
{
    self.dictionary[@"service"] = val;
}
@end
