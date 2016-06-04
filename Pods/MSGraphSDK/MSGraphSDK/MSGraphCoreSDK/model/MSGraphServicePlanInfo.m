// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphServicePlanInfo()
{
    NSString* _servicePlanId;
    NSString* _servicePlanName;
    NSString* _provisioningStatus;
    NSString* _appliesTo;
}
@end

@implementation MSGraphServicePlanInfo

- (NSString*) servicePlanId
{
    return self.dictionary[@"servicePlanId"];
}
- (void) setServicePlanId: (NSString*) val
{
    self.dictionary[@"servicePlanId"] = val;
}
- (NSString*) servicePlanName
{
    return self.dictionary[@"servicePlanName"];
}
- (void) setServicePlanName: (NSString*) val
{
    self.dictionary[@"servicePlanName"] = val;
}
- (NSString*) provisioningStatus
{
    return self.dictionary[@"provisioningStatus"];
}
- (void) setProvisioningStatus: (NSString*) val
{
    self.dictionary[@"provisioningStatus"] = val;
}
- (NSString*) appliesTo
{
    return self.dictionary[@"appliesTo"];
}
- (void) setAppliesTo: (NSString*) val
{
    self.dictionary[@"appliesTo"] = val;
}
@end
