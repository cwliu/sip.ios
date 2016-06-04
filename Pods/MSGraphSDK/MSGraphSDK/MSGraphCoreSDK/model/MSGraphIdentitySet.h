// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphIdentity; 


#import "MSObject.h"

@interface MSGraphIdentitySet : MSObject

	@property (nonatomic, setter=setApplication:, getter=application) MSGraphIdentity* application;
		@property (nonatomic, setter=setDevice:, getter=device) MSGraphIdentity* device;
		@property (nonatomic, setter=setUser:, getter=user) MSGraphIdentity* user;
	
@end
