// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphIdentitySet; 


#import "MSObject.h"

@interface MSGraphShared : MSObject

	@property (nonatomic, setter=setOwner:, getter=owner) MSGraphIdentitySet* owner;
		@property (nonatomic, setter=setScope:, getter=scope) NSString* scope;
	
@end
