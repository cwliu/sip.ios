// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphLicenseUnitsDetail, MSGraphServicePlanInfo; 


#import "MSGraphEntity.h"

@interface MSGraphSubscribedSku : MSGraphEntity

  @property (nonatomic, setter=setCapabilityStatus:, getter=capabilityStatus) NSString* capabilityStatus;
    @property (nonatomic, setter=setConsumedUnits:, getter=consumedUnits) int32_t consumedUnits;
    @property (nonatomic, setter=setPrepaidUnits:, getter=prepaidUnits) MSGraphLicenseUnitsDetail* prepaidUnits;
    @property (nonatomic, setter=setServicePlans:, getter=servicePlans) NSArray* servicePlans;
    @property (nonatomic, setter=setSkuId:, getter=skuId) NSString* skuId;
    @property (nonatomic, setter=setSkuPartNumber:, getter=skuPartNumber) NSString* skuPartNumber;
    @property (nonatomic, setter=setAppliesTo:, getter=appliesTo) NSString* appliesTo;
  
@end
