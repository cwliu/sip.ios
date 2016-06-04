// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphUser()
{
    BOOL _accountEnabled;
    NSArray* _assignedLicenses;
    NSArray* _assignedPlans;
    NSArray* _businessPhones;
    NSString* _city;
    NSString* _companyName;
    NSString* _country;
    NSString* _department;
    NSString* _displayName;
    NSString* _givenName;
    NSString* _jobTitle;
    NSString* _mail;
    NSString* _mailNickname;
    NSString* _mobilePhone;
    NSString* _onPremisesImmutableId;
    NSDate* _onPremisesLastSyncDateTime;
    NSString* _onPremisesSecurityIdentifier;
    BOOL _onPremisesSyncEnabled;
    NSString* _passwordPolicies;
    MSGraphPasswordProfile* _passwordProfile;
    NSString* _officeLocation;
    NSString* _postalCode;
    NSString* _preferredLanguage;
    NSArray* _provisionedPlans;
    NSArray* _proxyAddresses;
    NSString* _state;
    NSString* _streetAddress;
    NSString* _surname;
    NSString* _usageLocation;
    NSString* _userPrincipalName;
    NSString* _userType;
    NSString* _aboutMe;
    NSDate* _birthday;
    NSDate* _hireDate;
    NSArray* _interests;
    NSString* _mySite;
    NSArray* _pastProjects;
    NSString* _preferredName;
    NSArray* _responsibilities;
    NSArray* _schools;
    NSArray* _skills;
    NSArray* _ownedDevices;
    NSArray* _registeredDevices;
    MSGraphDirectoryObject* _manager;
    NSArray* _directReports;
    NSArray* _memberOf;
    NSArray* _createdObjects;
    NSArray* _ownedObjects;
    NSArray* _messages;
    NSArray* _mailFolders;
    MSGraphCalendar* _calendar;
    NSArray* _calendars;
    NSArray* _calendarGroups;
    NSArray* _calendarView;
    NSArray* _events;
    NSArray* _contacts;
    NSArray* _contactFolders;
    MSGraphProfilePhoto* _photo;
    MSGraphDrive* _drive;
}
@end

@implementation MSGraphUser

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.user";
    }
    return self;
}
- (BOOL) accountEnabled
{
    _accountEnabled = [self.dictionary[@"accountEnabled"] boolValue];
    return _accountEnabled;
}
- (void) setAccountEnabled: (BOOL) val
{
    _accountEnabled = val;
    self.dictionary[@"accountEnabled"] = @(val);
}
- (NSArray*) assignedLicenses
{
    if(!_assignedLicenses){
        
    NSMutableArray *assignedLicensesResult = [NSMutableArray array];
    NSArray *assignedLicenses = self.dictionary[@"assignedLicenses"];

    if ([assignedLicenses isKindOfClass:[NSArray class]]){
        for (id assignedLicense in assignedLicenses){
            [assignedLicensesResult addObject:[[MSGraphAssignedLicense alloc] initWithDictionary: assignedLicense]];
        }
    }

    _assignedLicenses = assignedLicensesResult;
        
    }
    return _assignedLicenses;
}
- (void) setAssignedLicenses: (NSArray*) val
{
    _assignedLicenses = val;
    self.dictionary[@"assignedLicenses"] = val;
}
- (NSArray*) assignedPlans
{
    if(!_assignedPlans){
        
    NSMutableArray *assignedPlansResult = [NSMutableArray array];
    NSArray *assignedPlans = self.dictionary[@"assignedPlans"];

    if ([assignedPlans isKindOfClass:[NSArray class]]){
        for (id assignedPlan in assignedPlans){
            [assignedPlansResult addObject:[[MSGraphAssignedPlan alloc] initWithDictionary: assignedPlan]];
        }
    }

    _assignedPlans = assignedPlansResult;
        
    }
    return _assignedPlans;
}
- (void) setAssignedPlans: (NSArray*) val
{
    _assignedPlans = val;
    self.dictionary[@"assignedPlans"] = val;
}
- (NSArray*) businessPhones
{
    return self.dictionary[@"businessPhones"];
}
- (void) setBusinessPhones: (NSArray*) val
{
    self.dictionary[@"businessPhones"] = val;
}
- (NSString*) city
{
    return self.dictionary[@"city"];
}
- (void) setCity: (NSString*) val
{
    self.dictionary[@"city"] = val;
}
- (NSString*) companyName
{
    return self.dictionary[@"companyName"];
}
- (void) setCompanyName: (NSString*) val
{
    self.dictionary[@"companyName"] = val;
}
- (NSString*) country
{
    return self.dictionary[@"country"];
}
- (void) setCountry: (NSString*) val
{
    self.dictionary[@"country"] = val;
}
- (NSString*) department
{
    return self.dictionary[@"department"];
}
- (void) setDepartment: (NSString*) val
{
    self.dictionary[@"department"] = val;
}
- (NSString*) displayName
{
    return self.dictionary[@"displayName"];
}
- (void) setDisplayName: (NSString*) val
{
    self.dictionary[@"displayName"] = val;
}
- (NSString*) givenName
{
    return self.dictionary[@"givenName"];
}
- (void) setGivenName: (NSString*) val
{
    self.dictionary[@"givenName"] = val;
}
- (NSString*) jobTitle
{
    return self.dictionary[@"jobTitle"];
}
- (void) setJobTitle: (NSString*) val
{
    self.dictionary[@"jobTitle"] = val;
}
- (NSString*) mail
{
    return self.dictionary[@"mail"];
}
- (void) setMail: (NSString*) val
{
    self.dictionary[@"mail"] = val;
}
- (NSString*) mailNickname
{
    return self.dictionary[@"mailNickname"];
}
- (void) setMailNickname: (NSString*) val
{
    self.dictionary[@"mailNickname"] = val;
}
- (NSString*) mobilePhone
{
    return self.dictionary[@"mobilePhone"];
}
- (void) setMobilePhone: (NSString*) val
{
    self.dictionary[@"mobilePhone"] = val;
}
- (NSString*) onPremisesImmutableId
{
    return self.dictionary[@"onPremisesImmutableId"];
}
- (void) setOnPremisesImmutableId: (NSString*) val
{
    self.dictionary[@"onPremisesImmutableId"] = val;
}
- (NSDate*) onPremisesLastSyncDateTime
{
    if(!_onPremisesLastSyncDateTime){
        _onPremisesLastSyncDateTime = [NSDate ms_dateFromString: self.dictionary[@"onPremisesLastSyncDateTime"]];
    }
    return _onPremisesLastSyncDateTime;
}
- (void) setOnPremisesLastSyncDateTime: (NSDate*) val
{
    _onPremisesLastSyncDateTime = val;
    self.dictionary[@"onPremisesLastSyncDateTime"] = val;
}
- (NSString*) onPremisesSecurityIdentifier
{
    return self.dictionary[@"onPremisesSecurityIdentifier"];
}
- (void) setOnPremisesSecurityIdentifier: (NSString*) val
{
    self.dictionary[@"onPremisesSecurityIdentifier"] = val;
}
- (BOOL) onPremisesSyncEnabled
{
    _onPremisesSyncEnabled = [self.dictionary[@"onPremisesSyncEnabled"] boolValue];
    return _onPremisesSyncEnabled;
}
- (void) setOnPremisesSyncEnabled: (BOOL) val
{
    _onPremisesSyncEnabled = val;
    self.dictionary[@"onPremisesSyncEnabled"] = @(val);
}
- (NSString*) passwordPolicies
{
    return self.dictionary[@"passwordPolicies"];
}
- (void) setPasswordPolicies: (NSString*) val
{
    self.dictionary[@"passwordPolicies"] = val;
}
- (MSGraphPasswordProfile*) passwordProfile
{
    if(!_passwordProfile){
        _passwordProfile = [[MSGraphPasswordProfile alloc] initWithDictionary: self.dictionary[@"passwordProfile"]];
    }
    return _passwordProfile;
}
- (void) setPasswordProfile: (MSGraphPasswordProfile*) val
{
    _passwordProfile = val;
    self.dictionary[@"passwordProfile"] = val;
}
- (NSString*) officeLocation
{
    return self.dictionary[@"officeLocation"];
}
- (void) setOfficeLocation: (NSString*) val
{
    self.dictionary[@"officeLocation"] = val;
}
- (NSString*) postalCode
{
    return self.dictionary[@"postalCode"];
}
- (void) setPostalCode: (NSString*) val
{
    self.dictionary[@"postalCode"] = val;
}
- (NSString*) preferredLanguage
{
    return self.dictionary[@"preferredLanguage"];
}
- (void) setPreferredLanguage: (NSString*) val
{
    self.dictionary[@"preferredLanguage"] = val;
}
- (NSArray*) provisionedPlans
{
    if(!_provisionedPlans){
        
    NSMutableArray *provisionedPlansResult = [NSMutableArray array];
    NSArray *provisionedPlans = self.dictionary[@"provisionedPlans"];

    if ([provisionedPlans isKindOfClass:[NSArray class]]){
        for (id provisionedPlan in provisionedPlans){
            [provisionedPlansResult addObject:[[MSGraphProvisionedPlan alloc] initWithDictionary: provisionedPlan]];
        }
    }

    _provisionedPlans = provisionedPlansResult;
        
    }
    return _provisionedPlans;
}
- (void) setProvisionedPlans: (NSArray*) val
{
    _provisionedPlans = val;
    self.dictionary[@"provisionedPlans"] = val;
}
- (NSArray*) proxyAddresses
{
    return self.dictionary[@"proxyAddresses"];
}
- (void) setProxyAddresses: (NSArray*) val
{
    self.dictionary[@"proxyAddresses"] = val;
}
- (NSString*) state
{
    return self.dictionary[@"state"];
}
- (void) setState: (NSString*) val
{
    self.dictionary[@"state"] = val;
}
- (NSString*) streetAddress
{
    return self.dictionary[@"streetAddress"];
}
- (void) setStreetAddress: (NSString*) val
{
    self.dictionary[@"streetAddress"] = val;
}
- (NSString*) surname
{
    return self.dictionary[@"surname"];
}
- (void) setSurname: (NSString*) val
{
    self.dictionary[@"surname"] = val;
}
- (NSString*) usageLocation
{
    return self.dictionary[@"usageLocation"];
}
- (void) setUsageLocation: (NSString*) val
{
    self.dictionary[@"usageLocation"] = val;
}
- (NSString*) userPrincipalName
{
    return self.dictionary[@"userPrincipalName"];
}
- (void) setUserPrincipalName: (NSString*) val
{
    self.dictionary[@"userPrincipalName"] = val;
}
- (NSString*) userType
{
    return self.dictionary[@"userType"];
}
- (void) setUserType: (NSString*) val
{
    self.dictionary[@"userType"] = val;
}
- (NSString*) aboutMe
{
    return self.dictionary[@"aboutMe"];
}
- (void) setAboutMe: (NSString*) val
{
    self.dictionary[@"aboutMe"] = val;
}
- (NSDate*) birthday
{
    if(!_birthday){
        _birthday = [NSDate ms_dateFromString: self.dictionary[@"birthday"]];
    }
    return _birthday;
}
- (void) setBirthday: (NSDate*) val
{
    _birthday = val;
    self.dictionary[@"birthday"] = val;
}
- (NSDate*) hireDate
{
    if(!_hireDate){
        _hireDate = [NSDate ms_dateFromString: self.dictionary[@"hireDate"]];
    }
    return _hireDate;
}
- (void) setHireDate: (NSDate*) val
{
    _hireDate = val;
    self.dictionary[@"hireDate"] = val;
}
- (NSArray*) interests
{
    return self.dictionary[@"interests"];
}
- (void) setInterests: (NSArray*) val
{
    self.dictionary[@"interests"] = val;
}
- (NSString*) mySite
{
    return self.dictionary[@"mySite"];
}
- (void) setMySite: (NSString*) val
{
    self.dictionary[@"mySite"] = val;
}
- (NSArray*) pastProjects
{
    return self.dictionary[@"pastProjects"];
}
- (void) setPastProjects: (NSArray*) val
{
    self.dictionary[@"pastProjects"] = val;
}
- (NSString*) preferredName
{
    return self.dictionary[@"preferredName"];
}
- (void) setPreferredName: (NSString*) val
{
    self.dictionary[@"preferredName"] = val;
}
- (NSArray*) responsibilities
{
    return self.dictionary[@"responsibilities"];
}
- (void) setResponsibilities: (NSArray*) val
{
    self.dictionary[@"responsibilities"] = val;
}
- (NSArray*) schools
{
    return self.dictionary[@"schools"];
}
- (void) setSchools: (NSArray*) val
{
    self.dictionary[@"schools"] = val;
}
- (NSArray*) skills
{
    return self.dictionary[@"skills"];
}
- (void) setSkills: (NSArray*) val
{
    self.dictionary[@"skills"] = val;
}
- (NSArray*) ownedDevices
{
    if(!_ownedDevices){
        
    NSMutableArray *ownedDevicesResult = [NSMutableArray array];
    NSArray *ownedDevices = self.dictionary[@"ownedDevices"];

    if ([ownedDevices isKindOfClass:[NSArray class]]){
        for (id directoryObject in ownedDevices){
            [ownedDevicesResult addObject:[[MSGraphDirectoryObject alloc] initWithDictionary: directoryObject]];
        }
    }

    _ownedDevices = ownedDevicesResult;
        
    }
    return _ownedDevices;
}
- (void) setOwnedDevices: (NSArray*) val
{
    _ownedDevices = val;
    self.dictionary[@"ownedDevices"] = val;
}
- (NSArray*) registeredDevices
{
    if(!_registeredDevices){
        
    NSMutableArray *registeredDevicesResult = [NSMutableArray array];
    NSArray *registeredDevices = self.dictionary[@"registeredDevices"];

    if ([registeredDevices isKindOfClass:[NSArray class]]){
        for (id directoryObject in registeredDevices){
            [registeredDevicesResult addObject:[[MSGraphDirectoryObject alloc] initWithDictionary: directoryObject]];
        }
    }

    _registeredDevices = registeredDevicesResult;
        
    }
    return _registeredDevices;
}
- (void) setRegisteredDevices: (NSArray*) val
{
    _registeredDevices = val;
    self.dictionary[@"registeredDevices"] = val;
}
- (MSGraphDirectoryObject*) manager
{
    if(!_manager){
        _manager = [[MSGraphDirectoryObject alloc] initWithDictionary: self.dictionary[@"manager"]];
    }
    return _manager;
}
- (void) setManager: (MSGraphDirectoryObject*) val
{
    _manager = val;
    self.dictionary[@"manager"] = val;
}
- (NSArray*) directReports
{
    if(!_directReports){
        
    NSMutableArray *directReportsResult = [NSMutableArray array];
    NSArray *directReports = self.dictionary[@"directReports"];

    if ([directReports isKindOfClass:[NSArray class]]){
        for (id directoryObject in directReports){
            [directReportsResult addObject:[[MSGraphDirectoryObject alloc] initWithDictionary: directoryObject]];
        }
    }

    _directReports = directReportsResult;
        
    }
    return _directReports;
}
- (void) setDirectReports: (NSArray*) val
{
    _directReports = val;
    self.dictionary[@"directReports"] = val;
}
- (NSArray*) memberOf
{
    if(!_memberOf){
        
    NSMutableArray *memberOfResult = [NSMutableArray array];
    NSArray *memberOf = self.dictionary[@"memberOf"];

    if ([memberOf isKindOfClass:[NSArray class]]){
        for (id directoryObject in memberOf){
            [memberOfResult addObject:[[MSGraphDirectoryObject alloc] initWithDictionary: directoryObject]];
        }
    }

    _memberOf = memberOfResult;
        
    }
    return _memberOf;
}
- (void) setMemberOf: (NSArray*) val
{
    _memberOf = val;
    self.dictionary[@"memberOf"] = val;
}
- (NSArray*) createdObjects
{
    if(!_createdObjects){
        
    NSMutableArray *createdObjectsResult = [NSMutableArray array];
    NSArray *createdObjects = self.dictionary[@"createdObjects"];

    if ([createdObjects isKindOfClass:[NSArray class]]){
        for (id directoryObject in createdObjects){
            [createdObjectsResult addObject:[[MSGraphDirectoryObject alloc] initWithDictionary: directoryObject]];
        }
    }

    _createdObjects = createdObjectsResult;
        
    }
    return _createdObjects;
}
- (void) setCreatedObjects: (NSArray*) val
{
    _createdObjects = val;
    self.dictionary[@"createdObjects"] = val;
}
- (NSArray*) ownedObjects
{
    if(!_ownedObjects){
        
    NSMutableArray *ownedObjectsResult = [NSMutableArray array];
    NSArray *ownedObjects = self.dictionary[@"ownedObjects"];

    if ([ownedObjects isKindOfClass:[NSArray class]]){
        for (id directoryObject in ownedObjects){
            [ownedObjectsResult addObject:[[MSGraphDirectoryObject alloc] initWithDictionary: directoryObject]];
        }
    }

    _ownedObjects = ownedObjectsResult;
        
    }
    return _ownedObjects;
}
- (void) setOwnedObjects: (NSArray*) val
{
    _ownedObjects = val;
    self.dictionary[@"ownedObjects"] = val;
}
- (NSArray*) messages
{
    if(!_messages){
        
    NSMutableArray *messagesResult = [NSMutableArray array];
    NSArray *messages = self.dictionary[@"messages"];

    if ([messages isKindOfClass:[NSArray class]]){
        for (id message in messages){
            [messagesResult addObject:[[MSGraphMessage alloc] initWithDictionary: message]];
        }
    }

    _messages = messagesResult;
        
    }
    return _messages;
}
- (void) setMessages: (NSArray*) val
{
    _messages = val;
    self.dictionary[@"messages"] = val;
}
- (NSArray*) mailFolders
{
    if(!_mailFolders){
        
    NSMutableArray *mailFoldersResult = [NSMutableArray array];
    NSArray *mailFolders = self.dictionary[@"mailFolders"];

    if ([mailFolders isKindOfClass:[NSArray class]]){
        for (id mailFolder in mailFolders){
            [mailFoldersResult addObject:[[MSGraphMailFolder alloc] initWithDictionary: mailFolder]];
        }
    }

    _mailFolders = mailFoldersResult;
        
    }
    return _mailFolders;
}
- (void) setMailFolders: (NSArray*) val
{
    _mailFolders = val;
    self.dictionary[@"mailFolders"] = val;
}
- (MSGraphCalendar*) calendar
{
    if(!_calendar){
        _calendar = [[MSGraphCalendar alloc] initWithDictionary: self.dictionary[@"calendar"]];
    }
    return _calendar;
}
- (void) setCalendar: (MSGraphCalendar*) val
{
    _calendar = val;
    self.dictionary[@"calendar"] = val;
}
- (NSArray*) calendars
{
    if(!_calendars){
        
    NSMutableArray *calendarsResult = [NSMutableArray array];
    NSArray *calendars = self.dictionary[@"calendars"];

    if ([calendars isKindOfClass:[NSArray class]]){
        for (id calendar in calendars){
            [calendarsResult addObject:[[MSGraphCalendar alloc] initWithDictionary: calendar]];
        }
    }

    _calendars = calendarsResult;
        
    }
    return _calendars;
}
- (void) setCalendars: (NSArray*) val
{
    _calendars = val;
    self.dictionary[@"calendars"] = val;
}
- (NSArray*) calendarGroups
{
    if(!_calendarGroups){
        
    NSMutableArray *calendarGroupsResult = [NSMutableArray array];
    NSArray *calendarGroups = self.dictionary[@"calendarGroups"];

    if ([calendarGroups isKindOfClass:[NSArray class]]){
        for (id calendarGroup in calendarGroups){
            [calendarGroupsResult addObject:[[MSGraphCalendarGroup alloc] initWithDictionary: calendarGroup]];
        }
    }

    _calendarGroups = calendarGroupsResult;
        
    }
    return _calendarGroups;
}
- (void) setCalendarGroups: (NSArray*) val
{
    _calendarGroups = val;
    self.dictionary[@"calendarGroups"] = val;
}
- (NSArray*) calendarView
{
    if(!_calendarView){
        
    NSMutableArray *calendarViewResult = [NSMutableArray array];
    NSArray *calendarView = self.dictionary[@"calendarView"];

    if ([calendarView isKindOfClass:[NSArray class]]){
        for (id event in calendarView){
            [calendarViewResult addObject:[[MSGraphEvent alloc] initWithDictionary: event]];
        }
    }

    _calendarView = calendarViewResult;
        
    }
    return _calendarView;
}
- (void) setCalendarView: (NSArray*) val
{
    _calendarView = val;
    self.dictionary[@"calendarView"] = val;
}
- (NSArray*) events
{
    if(!_events){
        
    NSMutableArray *eventsResult = [NSMutableArray array];
    NSArray *events = self.dictionary[@"events"];

    if ([events isKindOfClass:[NSArray class]]){
        for (id event in events){
            [eventsResult addObject:[[MSGraphEvent alloc] initWithDictionary: event]];
        }
    }

    _events = eventsResult;
        
    }
    return _events;
}
- (void) setEvents: (NSArray*) val
{
    _events = val;
    self.dictionary[@"events"] = val;
}
- (NSArray*) contacts
{
    if(!_contacts){
        
    NSMutableArray *contactsResult = [NSMutableArray array];
    NSArray *contacts = self.dictionary[@"contacts"];

    if ([contacts isKindOfClass:[NSArray class]]){
        for (id contact in contacts){
            [contactsResult addObject:[[MSGraphContact alloc] initWithDictionary: contact]];
        }
    }

    _contacts = contactsResult;
        
    }
    return _contacts;
}
- (void) setContacts: (NSArray*) val
{
    _contacts = val;
    self.dictionary[@"contacts"] = val;
}
- (NSArray*) contactFolders
{
    if(!_contactFolders){
        
    NSMutableArray *contactFoldersResult = [NSMutableArray array];
    NSArray *contactFolders = self.dictionary[@"contactFolders"];

    if ([contactFolders isKindOfClass:[NSArray class]]){
        for (id contactFolder in contactFolders){
            [contactFoldersResult addObject:[[MSGraphContactFolder alloc] initWithDictionary: contactFolder]];
        }
    }

    _contactFolders = contactFoldersResult;
        
    }
    return _contactFolders;
}
- (void) setContactFolders: (NSArray*) val
{
    _contactFolders = val;
    self.dictionary[@"contactFolders"] = val;
}
- (MSGraphProfilePhoto*) photo
{
    if(!_photo){
        _photo = [[MSGraphProfilePhoto alloc] initWithDictionary: self.dictionary[@"photo"]];
    }
    return _photo;
}
- (void) setPhoto: (MSGraphProfilePhoto*) val
{
    _photo = val;
    self.dictionary[@"photo"] = val;
}
- (MSGraphDrive*) drive
{
    if(!_drive){
        _drive = [[MSGraphDrive alloc] initWithDictionary: self.dictionary[@"drive"]];
    }
    return _drive;
}
- (void) setDrive: (MSGraphDrive*) val
{
    _drive = val;
    self.dictionary[@"drive"] = val;
}
- (MSGraphMessage*) messages:(NSInteger)index
{
   MSGraphMessage* messages = nil;
   if (self.messages) {
       messages = self.messages[index];
   }
   return messages;
}
- (MSGraphEvent*) events:(NSInteger)index
{
   MSGraphEvent* events = nil;
   if (self.events) {
       events = self.events[index];
   }
   return events;
}

@end
