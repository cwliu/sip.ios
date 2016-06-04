// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphEvent; 
#import "MSGraphCalendarColor.h"


#import "MSGraphEntity.h"

@interface MSGraphCalendar : MSGraphEntity

  @property (nonatomic, setter=setName:, getter=name) NSString* name;
    @property (nonatomic, setter=setColor:, getter=color) MSGraphCalendarColor* color;
    @property (nonatomic, setter=setChangeKey:, getter=changeKey) NSString* changeKey;
    @property (nonatomic, setter=setEvents:, getter=events) NSArray* events;
    @property (nonatomic, setter=setCalendarView:, getter=calendarView) NSArray* calendarView;
  - (MSGraphEvent*) events:(NSInteger)index;

@end
