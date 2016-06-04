// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphContact()
{
    NSString* _parentFolderId;
    NSDate* _birthday;
    NSString* _fileAs;
    NSString* _displayName;
    NSString* _givenName;
    NSString* _initials;
    NSString* _middleName;
    NSString* _nickName;
    NSString* _surname;
    NSString* _title;
    NSString* _yomiGivenName;
    NSString* _yomiSurname;
    NSString* _yomiCompanyName;
    NSString* _generation;
    NSArray* _emailAddresses;
    NSArray* _imAddresses;
    NSString* _jobTitle;
    NSString* _companyName;
    NSString* _department;
    NSString* _officeLocation;
    NSString* _profession;
    NSString* _businessHomePage;
    NSString* _assistantName;
    NSString* _manager;
    NSArray* _homePhones;
    NSString* _mobilePhone;
    NSArray* _businessPhones;
    MSGraphPhysicalAddress* _homeAddress;
    MSGraphPhysicalAddress* _businessAddress;
    MSGraphPhysicalAddress* _otherAddress;
    NSString* _spouseName;
    NSString* _personalNotes;
    NSArray* _children;
    MSGraphProfilePhoto* _photo;
}
@end

@implementation MSGraphContact

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.contact";
    }
    return self;
}
- (NSString*) parentFolderId
{
    return self.dictionary[@"parentFolderId"];
}
- (void) setParentFolderId: (NSString*) val
{
    self.dictionary[@"parentFolderId"] = val;
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
- (NSString*) fileAs
{
    return self.dictionary[@"fileAs"];
}
- (void) setFileAs: (NSString*) val
{
    self.dictionary[@"fileAs"] = val;
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
- (NSString*) initials
{
    return self.dictionary[@"initials"];
}
- (void) setInitials: (NSString*) val
{
    self.dictionary[@"initials"] = val;
}
- (NSString*) middleName
{
    return self.dictionary[@"middleName"];
}
- (void) setMiddleName: (NSString*) val
{
    self.dictionary[@"middleName"] = val;
}
- (NSString*) nickName
{
    return self.dictionary[@"nickName"];
}
- (void) setNickName: (NSString*) val
{
    self.dictionary[@"nickName"] = val;
}
- (NSString*) surname
{
    return self.dictionary[@"surname"];
}
- (void) setSurname: (NSString*) val
{
    self.dictionary[@"surname"] = val;
}
- (NSString*) title
{
    return self.dictionary[@"title"];
}
- (void) setTitle: (NSString*) val
{
    self.dictionary[@"title"] = val;
}
- (NSString*) yomiGivenName
{
    return self.dictionary[@"yomiGivenName"];
}
- (void) setYomiGivenName: (NSString*) val
{
    self.dictionary[@"yomiGivenName"] = val;
}
- (NSString*) yomiSurname
{
    return self.dictionary[@"yomiSurname"];
}
- (void) setYomiSurname: (NSString*) val
{
    self.dictionary[@"yomiSurname"] = val;
}
- (NSString*) yomiCompanyName
{
    return self.dictionary[@"yomiCompanyName"];
}
- (void) setYomiCompanyName: (NSString*) val
{
    self.dictionary[@"yomiCompanyName"] = val;
}
- (NSString*) generation
{
    return self.dictionary[@"generation"];
}
- (void) setGeneration: (NSString*) val
{
    self.dictionary[@"generation"] = val;
}
- (NSArray*) emailAddresses
{
    if(!_emailAddresses){
        
    NSMutableArray *emailAddressesResult = [NSMutableArray array];
    NSArray *emailAddresses = self.dictionary[@"emailAddresses"];

    if ([emailAddresses isKindOfClass:[NSArray class]]){
        for (id emailAddress in emailAddresses){
            [emailAddressesResult addObject:[[MSGraphEmailAddress alloc] initWithDictionary: emailAddress]];
        }
    }

    _emailAddresses = emailAddressesResult;
        
    }
    return _emailAddresses;
}
- (void) setEmailAddresses: (NSArray*) val
{
    _emailAddresses = val;
    self.dictionary[@"emailAddresses"] = val;
}
- (NSArray*) imAddresses
{
    return self.dictionary[@"imAddresses"];
}
- (void) setImAddresses: (NSArray*) val
{
    self.dictionary[@"imAddresses"] = val;
}
- (NSString*) jobTitle
{
    return self.dictionary[@"jobTitle"];
}
- (void) setJobTitle: (NSString*) val
{
    self.dictionary[@"jobTitle"] = val;
}
- (NSString*) companyName
{
    return self.dictionary[@"companyName"];
}
- (void) setCompanyName: (NSString*) val
{
    self.dictionary[@"companyName"] = val;
}
- (NSString*) department
{
    return self.dictionary[@"department"];
}
- (void) setDepartment: (NSString*) val
{
    self.dictionary[@"department"] = val;
}
- (NSString*) officeLocation
{
    return self.dictionary[@"officeLocation"];
}
- (void) setOfficeLocation: (NSString*) val
{
    self.dictionary[@"officeLocation"] = val;
}
- (NSString*) profession
{
    return self.dictionary[@"profession"];
}
- (void) setProfession: (NSString*) val
{
    self.dictionary[@"profession"] = val;
}
- (NSString*) businessHomePage
{
    return self.dictionary[@"businessHomePage"];
}
- (void) setBusinessHomePage: (NSString*) val
{
    self.dictionary[@"businessHomePage"] = val;
}
- (NSString*) assistantName
{
    return self.dictionary[@"assistantName"];
}
- (void) setAssistantName: (NSString*) val
{
    self.dictionary[@"assistantName"] = val;
}
- (NSString*) manager
{
    return self.dictionary[@"manager"];
}
- (void) setManager: (NSString*) val
{
    self.dictionary[@"manager"] = val;
}
- (NSArray*) homePhones
{
    return self.dictionary[@"homePhones"];
}
- (void) setHomePhones: (NSArray*) val
{
    self.dictionary[@"homePhones"] = val;
}
- (NSString*) mobilePhone
{
    return self.dictionary[@"mobilePhone"];
}
- (void) setMobilePhone: (NSString*) val
{
    self.dictionary[@"mobilePhone"] = val;
}
- (NSArray*) businessPhones
{
    return self.dictionary[@"businessPhones"];
}
- (void) setBusinessPhones: (NSArray*) val
{
    self.dictionary[@"businessPhones"] = val;
}
- (MSGraphPhysicalAddress*) homeAddress
{
    if(!_homeAddress){
        _homeAddress = [[MSGraphPhysicalAddress alloc] initWithDictionary: self.dictionary[@"homeAddress"]];
    }
    return _homeAddress;
}
- (void) setHomeAddress: (MSGraphPhysicalAddress*) val
{
    _homeAddress = val;
    self.dictionary[@"homeAddress"] = val;
}
- (MSGraphPhysicalAddress*) businessAddress
{
    if(!_businessAddress){
        _businessAddress = [[MSGraphPhysicalAddress alloc] initWithDictionary: self.dictionary[@"businessAddress"]];
    }
    return _businessAddress;
}
- (void) setBusinessAddress: (MSGraphPhysicalAddress*) val
{
    _businessAddress = val;
    self.dictionary[@"businessAddress"] = val;
}
- (MSGraphPhysicalAddress*) otherAddress
{
    if(!_otherAddress){
        _otherAddress = [[MSGraphPhysicalAddress alloc] initWithDictionary: self.dictionary[@"otherAddress"]];
    }
    return _otherAddress;
}
- (void) setOtherAddress: (MSGraphPhysicalAddress*) val
{
    _otherAddress = val;
    self.dictionary[@"otherAddress"] = val;
}
- (NSString*) spouseName
{
    return self.dictionary[@"spouseName"];
}
- (void) setSpouseName: (NSString*) val
{
    self.dictionary[@"spouseName"] = val;
}
- (NSString*) personalNotes
{
    return self.dictionary[@"personalNotes"];
}
- (void) setPersonalNotes: (NSString*) val
{
    self.dictionary[@"personalNotes"] = val;
}
- (NSArray*) children
{
    return self.dictionary[@"children"];
}
- (void) setChildren: (NSArray*) val
{
    self.dictionary[@"children"] = val;
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

@end
