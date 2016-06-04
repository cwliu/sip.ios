// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphResponseStatus; 
#import "MSGraphAttendeeType.h"


#import "MSGraphRecipient.h"

@interface MSGraphAttendee : MSGraphRecipient

	@property (nonatomic, setter=setStatus:, getter=status) MSGraphResponseStatus* status;
		@property (nonatomic, setter=setType:, getter=type) MSGraphAttendeeType* type;
	
@end
