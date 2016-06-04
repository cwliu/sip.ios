// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphResponseStatus, MSGraphItemBody, MSGraphDateTimeTimeZone, MSGraphLocation, MSGraphPatternedRecurrence, MSGraphAttendee, MSGraphRecipient, MSGraphCalendar, MSGraphAttachment; 
#import "MSGraphImportance.h"
#import "MSGraphSensitivity.h"
#import "MSGraphFreeBusyStatus.h"
#import "MSGraphEventType.h"


#import "MSGraphOutlookItem.h"

@interface MSGraphEvent : MSGraphOutlookItem

  @property (nonatomic, setter=setOriginalStartTimeZone:, getter=originalStartTimeZone) NSString* originalStartTimeZone;
    @property (nonatomic, setter=setOriginalEndTimeZone:, getter=originalEndTimeZone) NSString* originalEndTimeZone;
    @property (nonatomic, setter=setResponseStatus:, getter=responseStatus) MSGraphResponseStatus* responseStatus;
    @property (nonatomic, setter=setICalUId:, getter=iCalUId) NSString* iCalUId;
    @property (nonatomic, setter=setReminderMinutesBeforeStart:, getter=reminderMinutesBeforeStart) int32_t reminderMinutesBeforeStart;
    @property (nonatomic, setter=setIsReminderOn:, getter=isReminderOn) BOOL isReminderOn;
    @property (nonatomic, setter=setHasAttachments:, getter=hasAttachments) BOOL hasAttachments;
    @property (nonatomic, setter=setSubject:, getter=subject) NSString* subject;
    @property (nonatomic, setter=setBody:, getter=body) MSGraphItemBody* body;
    @property (nonatomic, setter=setBodyPreview:, getter=bodyPreview) NSString* bodyPreview;
    @property (nonatomic, setter=setImportance:, getter=importance) MSGraphImportance* importance;
    @property (nonatomic, setter=setSensitivity:, getter=sensitivity) MSGraphSensitivity* sensitivity;
    @property (nonatomic, setter=setStart:, getter=start) MSGraphDateTimeTimeZone* start;
    @property (nonatomic, setter=setOriginalStart:, getter=originalStart) NSDate* originalStart;
    @property (nonatomic, setter=setEnd:, getter=end) MSGraphDateTimeTimeZone* end;
    @property (nonatomic, setter=setLocation:, getter=location) MSGraphLocation* location;
    @property (nonatomic, setter=setIsAllDay:, getter=isAllDay) BOOL isAllDay;
    @property (nonatomic, setter=setIsCancelled:, getter=isCancelled) BOOL isCancelled;
    @property (nonatomic, setter=setIsOrganizer:, getter=isOrganizer) BOOL isOrganizer;
    @property (nonatomic, setter=setRecurrence:, getter=recurrence) MSGraphPatternedRecurrence* recurrence;
    @property (nonatomic, setter=setResponseRequested:, getter=responseRequested) BOOL responseRequested;
    @property (nonatomic, setter=setSeriesMasterId:, getter=seriesMasterId) NSString* seriesMasterId;
    @property (nonatomic, setter=setShowAs:, getter=showAs) MSGraphFreeBusyStatus* showAs;
    @property (nonatomic, setter=setType:, getter=type) MSGraphEventType* type;
    @property (nonatomic, setter=setAttendees:, getter=attendees) NSArray* attendees;
    @property (nonatomic, setter=setOrganizer:, getter=organizer) MSGraphRecipient* organizer;
    @property (nonatomic, setter=setWebLink:, getter=webLink) NSString* webLink;
    @property (nonatomic, setter=setCalendar:, getter=calendar) MSGraphCalendar* calendar;
    @property (nonatomic, setter=setInstances:, getter=instances) NSArray* instances;
    @property (nonatomic, setter=setAttachments:, getter=attachments) NSArray* attachments;
  
@end
