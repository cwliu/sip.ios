// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphRecurrencePatternType.h"
#import "MSGraphDayOfWeek.h"
#import "MSGraphWeekIndex.h"


#import "MSObject.h"

@interface MSGraphRecurrencePattern : MSObject

	@property (nonatomic, setter=setType:, getter=type) MSGraphRecurrencePatternType* type;
		@property (nonatomic, setter=setInterval:, getter=interval) int32_t interval;
		@property (nonatomic, setter=setMonth:, getter=month) int32_t month;
		@property (nonatomic, setter=setDayOfMonth:, getter=dayOfMonth) int32_t dayOfMonth;
		@property (nonatomic, setter=setDaysOfWeek:, getter=daysOfWeek) NSArray* daysOfWeek;
		@property (nonatomic, setter=setFirstDayOfWeek:, getter=firstDayOfWeek) MSGraphDayOfWeek* firstDayOfWeek;
		@property (nonatomic, setter=setIndex:, getter=index) MSGraphWeekIndex* index;
	
@end
