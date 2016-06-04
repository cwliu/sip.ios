// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphAssignedPlan, MSGraphProvisionedPlan, MSGraphVerifiedDomain; 


#import "MSGraphDirectoryObject.h"

@interface MSGraphOrganization : MSGraphDirectoryObject

  @property (nonatomic, setter=setAssignedPlans:, getter=assignedPlans) NSArray* assignedPlans;
    @property (nonatomic, setter=setBusinessPhones:, getter=businessPhones) NSArray* businessPhones;
    @property (nonatomic, setter=setCity:, getter=city) NSString* city;
    @property (nonatomic, setter=setCountry:, getter=country) NSString* country;
    @property (nonatomic, setter=setCountryLetterCode:, getter=countryLetterCode) NSString* countryLetterCode;
    @property (nonatomic, setter=setDisplayName:, getter=displayName) NSString* displayName;
    @property (nonatomic, setter=setMarketingNotificationEmails:, getter=marketingNotificationEmails) NSArray* marketingNotificationEmails;
    @property (nonatomic, setter=setOnPremisesLastSyncDateTime:, getter=onPremisesLastSyncDateTime) NSDate* onPremisesLastSyncDateTime;
    @property (nonatomic, setter=setOnPremisesSyncEnabled:, getter=onPremisesSyncEnabled) BOOL onPremisesSyncEnabled;
    @property (nonatomic, setter=setPostalCode:, getter=postalCode) NSString* postalCode;
    @property (nonatomic, setter=setPreferredLanguage:, getter=preferredLanguage) NSString* preferredLanguage;
    @property (nonatomic, setter=setProvisionedPlans:, getter=provisionedPlans) NSArray* provisionedPlans;
    @property (nonatomic, setter=setSecurityComplianceNotificationMails:, getter=securityComplianceNotificationMails) NSArray* securityComplianceNotificationMails;
    @property (nonatomic, setter=setSecurityComplianceNotificationPhones:, getter=securityComplianceNotificationPhones) NSArray* securityComplianceNotificationPhones;
    @property (nonatomic, setter=setState:, getter=state) NSString* state;
    @property (nonatomic, setter=setStreet:, getter=street) NSString* street;
    @property (nonatomic, setter=setTechnicalNotificationMails:, getter=technicalNotificationMails) NSArray* technicalNotificationMails;
    @property (nonatomic, setter=setVerifiedDomains:, getter=verifiedDomains) NSArray* verifiedDomains;
  
@end
