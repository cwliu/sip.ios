// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphOrganization()
{
    NSArray* _assignedPlans;
    NSArray* _businessPhones;
    NSString* _city;
    NSString* _country;
    NSString* _countryLetterCode;
    NSString* _displayName;
    NSArray* _marketingNotificationEmails;
    NSDate* _onPremisesLastSyncDateTime;
    BOOL _onPremisesSyncEnabled;
    NSString* _postalCode;
    NSString* _preferredLanguage;
    NSArray* _provisionedPlans;
    NSArray* _securityComplianceNotificationMails;
    NSArray* _securityComplianceNotificationPhones;
    NSString* _state;
    NSString* _street;
    NSArray* _technicalNotificationMails;
    NSArray* _verifiedDomains;
}
@end

@implementation MSGraphOrganization

- (id) init
{
    if (self = [super init]) {
        self.oDataType = @"#microsoft.graph.organization";
    }
    return self;
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
- (NSString*) country
{
    return self.dictionary[@"country"];
}
- (void) setCountry: (NSString*) val
{
    self.dictionary[@"country"] = val;
}
- (NSString*) countryLetterCode
{
    return self.dictionary[@"countryLetterCode"];
}
- (void) setCountryLetterCode: (NSString*) val
{
    self.dictionary[@"countryLetterCode"] = val;
}
- (NSString*) displayName
{
    return self.dictionary[@"displayName"];
}
- (void) setDisplayName: (NSString*) val
{
    self.dictionary[@"displayName"] = val;
}
- (NSArray*) marketingNotificationEmails
{
    return self.dictionary[@"marketingNotificationEmails"];
}
- (void) setMarketingNotificationEmails: (NSArray*) val
{
    self.dictionary[@"marketingNotificationEmails"] = val;
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
- (NSArray*) securityComplianceNotificationMails
{
    return self.dictionary[@"securityComplianceNotificationMails"];
}
- (void) setSecurityComplianceNotificationMails: (NSArray*) val
{
    self.dictionary[@"securityComplianceNotificationMails"] = val;
}
- (NSArray*) securityComplianceNotificationPhones
{
    return self.dictionary[@"securityComplianceNotificationPhones"];
}
- (void) setSecurityComplianceNotificationPhones: (NSArray*) val
{
    self.dictionary[@"securityComplianceNotificationPhones"] = val;
}
- (NSString*) state
{
    return self.dictionary[@"state"];
}
- (void) setState: (NSString*) val
{
    self.dictionary[@"state"] = val;
}
- (NSString*) street
{
    return self.dictionary[@"street"];
}
- (void) setStreet: (NSString*) val
{
    self.dictionary[@"street"] = val;
}
- (NSArray*) technicalNotificationMails
{
    return self.dictionary[@"technicalNotificationMails"];
}
- (void) setTechnicalNotificationMails: (NSArray*) val
{
    self.dictionary[@"technicalNotificationMails"] = val;
}
- (NSArray*) verifiedDomains
{
    if(!_verifiedDomains){
        
    NSMutableArray *verifiedDomainsResult = [NSMutableArray array];
    NSArray *verifiedDomains = self.dictionary[@"verifiedDomains"];

    if ([verifiedDomains isKindOfClass:[NSArray class]]){
        for (id verifiedDomain in verifiedDomains){
            [verifiedDomainsResult addObject:[[MSGraphVerifiedDomain alloc] initWithDictionary: verifiedDomain]];
        }
    }

    _verifiedDomains = verifiedDomainsResult;
        
    }
    return _verifiedDomains;
}
- (void) setVerifiedDomains: (NSArray*) val
{
    _verifiedDomains = val;
    self.dictionary[@"verifiedDomains"] = val;
}

@end
