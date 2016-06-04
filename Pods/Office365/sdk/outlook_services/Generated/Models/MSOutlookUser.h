/*******************************************************************************
**NOTE** This code was generated by a tool and will occasionally be
overwritten. We welcome comments and issues regarding this code; they will be
addressed in the generation tool. If you wish to submit pull requests, please
do so for the templates in that tool.

This code was generated by Vipr (https://github.com/microsoft/vipr) using
the T4TemplateWriter (https://github.com/msopentech/vipr-t4templatewriter).

Copyright (c) Microsoft Open Technologies, Inc. All Rights Reserved.
Licensed under the Apache License 2.0; see LICENSE in the source repository
root for authoritative license information.﻿
******************************************************************************/

@class MSOutlookFolder;
@class MSOutlookMessage;
@class MSOutlookCalendar;
@class MSOutlookCalendarGroup;
@class MSOutlookEvent;
@class MSOutlookContact;
@class MSOutlookContactFolder;

#import <Foundation/Foundation.h>
#import "MSOutlookEntity.h"

/**
* The header for type User.
*/

@interface MSOutlookUser : MSOutlookEntity

@property (copy, nonatomic, readwrite, getter=displayName, setter=setDisplayName:) NSString *DisplayName;
@property (copy, nonatomic, readwrite, getter=alias, setter=setAlias:) NSString *Alias;
@property (copy, nonatomic, readwrite, getter=mailboxGuid, setter=setMailboxGuid:) NSString *MailboxGuid;
@property (copy, nonatomic, readwrite, getter=folders, setter=setFolders:) NSMutableArray *Folders;
@property (copy, nonatomic, readwrite, getter=messages, setter=setMessages:) NSMutableArray *Messages;
@property (copy, nonatomic, readwrite, getter=rootFolder, setter=setRootFolder:) MSOutlookFolder *RootFolder;
@property (copy, nonatomic, readwrite, getter=calendars, setter=setCalendars:) NSMutableArray *Calendars;
@property (copy, nonatomic, readwrite, getter=calendar, setter=setCalendar:) MSOutlookCalendar *Calendar;
@property (copy, nonatomic, readwrite, getter=calendarGroups, setter=setCalendarGroups:) NSMutableArray *CalendarGroups;
@property (copy, nonatomic, readwrite, getter=events, setter=setEvents:) NSMutableArray *Events;
@property (copy, nonatomic, readwrite, getter=calendarView, setter=setCalendarView:) NSMutableArray *CalendarView;
@property (copy, nonatomic, readwrite, getter=contacts, setter=setContacts:) NSMutableArray *Contacts;
@property (copy, nonatomic, readwrite, getter=contactFolders, setter=setContactFolders:) NSMutableArray *ContactFolders;

@end