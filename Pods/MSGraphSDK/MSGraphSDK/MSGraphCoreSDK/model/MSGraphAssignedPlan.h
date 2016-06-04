// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.





#import "MSObject.h"

@interface MSGraphAssignedPlan : MSObject

	@property (nonatomic, setter=setAssignedDateTime:, getter=assignedDateTime) NSDate* assignedDateTime;
		@property (nonatomic, setter=setCapabilityStatus:, getter=capabilityStatus) NSString* capabilityStatus;
		@property (nonatomic, setter=setService:, getter=service) NSString* service;
		@property (nonatomic, setter=setServicePlanId:, getter=servicePlanId) NSString* servicePlanId;
	
@end
