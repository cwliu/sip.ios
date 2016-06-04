// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDateTimeTimeZone, MSGraphLocation; 


#import "MSObject.h"

@interface MSGraphReminder : MSObject

	@property (nonatomic, setter=setEventId:, getter=eventId) NSString* eventId;
		@property (nonatomic, setter=setEventStartTime:, getter=eventStartTime) MSGraphDateTimeTimeZone* eventStartTime;
		@property (nonatomic, setter=setEventEndTime:, getter=eventEndTime) MSGraphDateTimeTimeZone* eventEndTime;
		@property (nonatomic, setter=setChangeKey:, getter=changeKey) NSString* changeKey;
		@property (nonatomic, setter=setEventSubject:, getter=eventSubject) NSString* eventSubject;
		@property (nonatomic, setter=setEventLocation:, getter=eventLocation) MSGraphLocation* eventLocation;
		@property (nonatomic, setter=setEventWebLink:, getter=eventWebLink) NSString* eventWebLink;
		@property (nonatomic, setter=setReminderFireTime:, getter=reminderFireTime) MSGraphDateTimeTimeZone* reminderFireTime;
	
@end
