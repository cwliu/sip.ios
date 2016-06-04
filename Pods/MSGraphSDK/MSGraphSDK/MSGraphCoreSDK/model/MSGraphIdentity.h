// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.





#import "MSObject.h"

@interface MSGraphIdentity : MSObject

	@property (nonatomic, setter=setDisplayName:, getter=displayName) NSString* displayName;
		@property (nonatomic, setter=setIdentityId:, getter=identityId) NSString* identityId;
	
@end
