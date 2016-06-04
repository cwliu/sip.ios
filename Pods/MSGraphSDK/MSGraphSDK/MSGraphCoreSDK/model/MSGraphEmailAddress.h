// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.





#import "MSObject.h"

@interface MSGraphEmailAddress : MSObject

	@property (nonatomic, setter=setName:, getter=name) NSString* name;
		@property (nonatomic, setter=setAddress:, getter=address) NSString* address;
	
@end
