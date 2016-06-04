// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphCalendar; 


#import "MSGraphEntity.h"

@interface MSGraphCalendarGroup : MSGraphEntity

  @property (nonatomic, setter=setName:, getter=name) NSString* name;
    @property (nonatomic, setter=setClassId:, getter=classId) NSString* classId;
    @property (nonatomic, setter=setChangeKey:, getter=changeKey) NSString* changeKey;
    @property (nonatomic, setter=setCalendars:, getter=calendars) NSArray* calendars;
  
@end
