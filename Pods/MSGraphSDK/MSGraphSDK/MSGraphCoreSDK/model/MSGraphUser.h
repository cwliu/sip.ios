// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphAssignedLicense, MSGraphAssignedPlan, MSGraphPasswordProfile, MSGraphProvisionedPlan, MSGraphDirectoryObject, MSGraphMessage, MSGraphMailFolder, MSGraphCalendar, MSGraphCalendarGroup, MSGraphEvent, MSGraphContact, MSGraphContactFolder, MSGraphProfilePhoto, MSGraphDrive; 


#import "MSGraphDirectoryObject.h"

@interface MSGraphUser : MSGraphDirectoryObject

  @property (nonatomic, setter=setAccountEnabled:, getter=accountEnabled) BOOL accountEnabled;
    @property (nonatomic, setter=setAssignedLicenses:, getter=assignedLicenses) NSArray* assignedLicenses;
    @property (nonatomic, setter=setAssignedPlans:, getter=assignedPlans) NSArray* assignedPlans;
    @property (nonatomic, setter=setBusinessPhones:, getter=businessPhones) NSArray* businessPhones;
    @property (nonatomic, setter=setCity:, getter=city) NSString* city;
    @property (nonatomic, setter=setCompanyName:, getter=companyName) NSString* companyName;
    @property (nonatomic, setter=setCountry:, getter=country) NSString* country;
    @property (nonatomic, setter=setDepartment:, getter=department) NSString* department;
    @property (nonatomic, setter=setDisplayName:, getter=displayName) NSString* displayName;
    @property (nonatomic, setter=setGivenName:, getter=givenName) NSString* givenName;
    @property (nonatomic, setter=setJobTitle:, getter=jobTitle) NSString* jobTitle;
    @property (nonatomic, setter=setMail:, getter=mail) NSString* mail;
    @property (nonatomic, setter=setMailNickname:, getter=mailNickname) NSString* mailNickname;
    @property (nonatomic, setter=setMobilePhone:, getter=mobilePhone) NSString* mobilePhone;
    @property (nonatomic, setter=setOnPremisesImmutableId:, getter=onPremisesImmutableId) NSString* onPremisesImmutableId;
    @property (nonatomic, setter=setOnPremisesLastSyncDateTime:, getter=onPremisesLastSyncDateTime) NSDate* onPremisesLastSyncDateTime;
    @property (nonatomic, setter=setOnPremisesSecurityIdentifier:, getter=onPremisesSecurityIdentifier) NSString* onPremisesSecurityIdentifier;
    @property (nonatomic, setter=setOnPremisesSyncEnabled:, getter=onPremisesSyncEnabled) BOOL onPremisesSyncEnabled;
    @property (nonatomic, setter=setPasswordPolicies:, getter=passwordPolicies) NSString* passwordPolicies;
    @property (nonatomic, setter=setPasswordProfile:, getter=passwordProfile) MSGraphPasswordProfile* passwordProfile;
    @property (nonatomic, setter=setOfficeLocation:, getter=officeLocation) NSString* officeLocation;
    @property (nonatomic, setter=setPostalCode:, getter=postalCode) NSString* postalCode;
    @property (nonatomic, setter=setPreferredLanguage:, getter=preferredLanguage) NSString* preferredLanguage;
    @property (nonatomic, setter=setProvisionedPlans:, getter=provisionedPlans) NSArray* provisionedPlans;
    @property (nonatomic, setter=setProxyAddresses:, getter=proxyAddresses) NSArray* proxyAddresses;
    @property (nonatomic, setter=setState:, getter=state) NSString* state;
    @property (nonatomic, setter=setStreetAddress:, getter=streetAddress) NSString* streetAddress;
    @property (nonatomic, setter=setSurname:, getter=surname) NSString* surname;
    @property (nonatomic, setter=setUsageLocation:, getter=usageLocation) NSString* usageLocation;
    @property (nonatomic, setter=setUserPrincipalName:, getter=userPrincipalName) NSString* userPrincipalName;
    @property (nonatomic, setter=setUserType:, getter=userType) NSString* userType;
    @property (nonatomic, setter=setAboutMe:, getter=aboutMe) NSString* aboutMe;
    @property (nonatomic, setter=setBirthday:, getter=birthday) NSDate* birthday;
    @property (nonatomic, setter=setHireDate:, getter=hireDate) NSDate* hireDate;
    @property (nonatomic, setter=setInterests:, getter=interests) NSArray* interests;
    @property (nonatomic, setter=setMySite:, getter=mySite) NSString* mySite;
    @property (nonatomic, setter=setPastProjects:, getter=pastProjects) NSArray* pastProjects;
    @property (nonatomic, setter=setPreferredName:, getter=preferredName) NSString* preferredName;
    @property (nonatomic, setter=setResponsibilities:, getter=responsibilities) NSArray* responsibilities;
    @property (nonatomic, setter=setSchools:, getter=schools) NSArray* schools;
    @property (nonatomic, setter=setSkills:, getter=skills) NSArray* skills;
    @property (nonatomic, setter=setOwnedDevices:, getter=ownedDevices) NSArray* ownedDevices;
    @property (nonatomic, setter=setRegisteredDevices:, getter=registeredDevices) NSArray* registeredDevices;
    @property (nonatomic, setter=setManager:, getter=manager) MSGraphDirectoryObject* manager;
    @property (nonatomic, setter=setDirectReports:, getter=directReports) NSArray* directReports;
    @property (nonatomic, setter=setMemberOf:, getter=memberOf) NSArray* memberOf;
    @property (nonatomic, setter=setCreatedObjects:, getter=createdObjects) NSArray* createdObjects;
    @property (nonatomic, setter=setOwnedObjects:, getter=ownedObjects) NSArray* ownedObjects;
    @property (nonatomic, setter=setMessages:, getter=messages) NSArray* messages;
    @property (nonatomic, setter=setMailFolders:, getter=mailFolders) NSArray* mailFolders;
    @property (nonatomic, setter=setCalendar:, getter=calendar) MSGraphCalendar* calendar;
    @property (nonatomic, setter=setCalendars:, getter=calendars) NSArray* calendars;
    @property (nonatomic, setter=setCalendarGroups:, getter=calendarGroups) NSArray* calendarGroups;
    @property (nonatomic, setter=setCalendarView:, getter=calendarView) NSArray* calendarView;
    @property (nonatomic, setter=setEvents:, getter=events) NSArray* events;
    @property (nonatomic, setter=setContacts:, getter=contacts) NSArray* contacts;
    @property (nonatomic, setter=setContactFolders:, getter=contactFolders) NSArray* contactFolders;
    @property (nonatomic, setter=setPhoto:, getter=photo) MSGraphProfilePhoto* photo;
    @property (nonatomic, setter=setDrive:, getter=drive) MSGraphDrive* drive;
  - (MSGraphMessage*) messages:(NSInteger)index;
- (MSGraphEvent*) events:(NSInteger)index;

@end
