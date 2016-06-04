// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphPhysicalAddress; 


#import "MSObject.h"

@interface MSGraphLocation : MSObject

	@property (nonatomic, setter=setDisplayName:, getter=displayName) NSString* displayName;
		@property (nonatomic, setter=setAddress:, getter=address) MSGraphPhysicalAddress* address;
	
@end
