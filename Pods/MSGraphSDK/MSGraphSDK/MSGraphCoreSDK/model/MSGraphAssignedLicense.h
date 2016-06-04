// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.





#import "MSObject.h"

@interface MSGraphAssignedLicense : MSObject

	@property (nonatomic, setter=setDisabledPlans:, getter=disabledPlans) NSArray* disabledPlans;
		@property (nonatomic, setter=setSkuId:, getter=skuId) NSString* skuId;
	
@end
