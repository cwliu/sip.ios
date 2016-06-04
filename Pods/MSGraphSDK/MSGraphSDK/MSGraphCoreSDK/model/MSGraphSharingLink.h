// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphIdentity; 


#import "MSObject.h"

@interface MSGraphSharingLink : MSObject

	@property (nonatomic, setter=setApplication:, getter=application) MSGraphIdentity* application;
		@property (nonatomic, setter=setType:, getter=type) NSString* type;
		@property (nonatomic, setter=setWebUrl:, getter=webUrl) NSString* webUrl;
	
@end
