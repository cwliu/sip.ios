// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphRecurrencePattern, MSGraphRecurrenceRange; 


#import "MSObject.h"

@interface MSGraphPatternedRecurrence : MSObject

	@property (nonatomic, setter=setPattern:, getter=pattern) MSGraphRecurrencePattern* pattern;
		@property (nonatomic, setter=setRange:, getter=range) MSGraphRecurrenceRange* range;
	
@end
