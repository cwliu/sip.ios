// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDirectoryObject, MSGraphConversationThread, MSGraphCalendar, MSGraphEvent, MSGraphConversation, MSGraphProfilePhoto, MSGraphDrive; 


#import "MSGraphDirectoryObject.h"

@interface MSGraphGroup : MSGraphDirectoryObject

  @property (nonatomic, setter=setGroupDescription:, getter=groupDescription) NSString* groupDescription;
    @property (nonatomic, setter=setDisplayName:, getter=displayName) NSString* displayName;
    @property (nonatomic, setter=setGroupTypes:, getter=groupTypes) NSArray* groupTypes;
    @property (nonatomic, setter=setMail:, getter=mail) NSString* mail;
    @property (nonatomic, setter=setMailEnabled:, getter=mailEnabled) BOOL mailEnabled;
    @property (nonatomic, setter=setMailNickname:, getter=mailNickname) NSString* mailNickname;
    @property (nonatomic, setter=setOnPremisesLastSyncDateTime:, getter=onPremisesLastSyncDateTime) NSDate* onPremisesLastSyncDateTime;
    @property (nonatomic, setter=setOnPremisesSecurityIdentifier:, getter=onPremisesSecurityIdentifier) NSString* onPremisesSecurityIdentifier;
    @property (nonatomic, setter=setOnPremisesSyncEnabled:, getter=onPremisesSyncEnabled) BOOL onPremisesSyncEnabled;
    @property (nonatomic, setter=setProxyAddresses:, getter=proxyAddresses) NSArray* proxyAddresses;
    @property (nonatomic, setter=setSecurityEnabled:, getter=securityEnabled) BOOL securityEnabled;
    @property (nonatomic, setter=setVisibility:, getter=visibility) NSString* visibility;
    @property (nonatomic, setter=setAllowExternalSenders:, getter=allowExternalSenders) BOOL allowExternalSenders;
    @property (nonatomic, setter=setAutoSubscribeNewMembers:, getter=autoSubscribeNewMembers) BOOL autoSubscribeNewMembers;
    @property (nonatomic, setter=setIsSubscribedByMail:, getter=isSubscribedByMail) BOOL isSubscribedByMail;
    @property (nonatomic, setter=setUnseenCount:, getter=unseenCount) int32_t unseenCount;
    @property (nonatomic, setter=setMembers:, getter=members) NSArray* members;
    @property (nonatomic, setter=setMemberOf:, getter=memberOf) NSArray* memberOf;
    @property (nonatomic, setter=setCreatedOnBehalfOf:, getter=createdOnBehalfOf) MSGraphDirectoryObject* createdOnBehalfOf;
    @property (nonatomic, setter=setOwners:, getter=owners) NSArray* owners;
    @property (nonatomic, setter=setThreads:, getter=threads) NSArray* threads;
    @property (nonatomic, setter=setCalendar:, getter=calendar) MSGraphCalendar* calendar;
    @property (nonatomic, setter=setCalendarView:, getter=calendarView) NSArray* calendarView;
    @property (nonatomic, setter=setEvents:, getter=events) NSArray* events;
    @property (nonatomic, setter=setConversations:, getter=conversations) NSArray* conversations;
    @property (nonatomic, setter=setPhoto:, getter=photo) MSGraphProfilePhoto* photo;
    @property (nonatomic, setter=setAcceptedSenders:, getter=acceptedSenders) NSArray* acceptedSenders;
    @property (nonatomic, setter=setRejectedSenders:, getter=rejectedSenders) NSArray* rejectedSenders;
    @property (nonatomic, setter=setDrive:, getter=drive) MSGraphDrive* drive;
  - (MSGraphEvent*) events:(NSInteger)index;

@end
