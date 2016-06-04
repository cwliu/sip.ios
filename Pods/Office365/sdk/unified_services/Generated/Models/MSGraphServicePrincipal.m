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

#import "MSGraphModels.h"

/**
* The implementation file for type MSGraphServicePrincipal.
*/

@implementation MSGraphServicePrincipal	

@synthesize odataType = _odataType;
@synthesize accountEnabled = _accountEnabled;
@synthesize appDisplayName = _appDisplayName;
@synthesize appId = _appId;
@synthesize appOwnerTenantId = _appOwnerTenantId;
@synthesize appRoleAssignmentRequired = _appRoleAssignmentRequired;
@synthesize appRoles = _appRoles;
@synthesize displayName = _displayName;
@synthesize errorUrl = _errorUrl;
@synthesize homepage = _homepage;
@synthesize keyCredentials = _keyCredentials;
@synthesize logoutUrl = _logoutUrl;
@synthesize oauth2Permissions = _oauth2Permissions;
@synthesize passwordCredentials = _passwordCredentials;
@synthesize preferredTokenSigningKeyThumbprint = _preferredTokenSigningKeyThumbprint;
@synthesize publisherName = _publisherName;
@synthesize replyUrls = _replyUrls;
@synthesize samlMetadataUrl = _samlMetadataUrl;
@synthesize servicePrincipalNames = _servicePrincipalNames;
@synthesize tags = _tags;
@synthesize appRoleAssignedTo = _appRoleAssignedTo;
@synthesize appRoleAssignments = _appRoleAssignments;
@synthesize oauth2PermissionGrants = _oauth2PermissionGrants;
@synthesize memberOf = _memberOf;
@synthesize createdOnBehalfOf = _createdOnBehalfOf;
@synthesize createdObjects = _createdObjects;
@synthesize owners = _owners;
@synthesize ownedObjects = _ownedObjects;

- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.Graph.ServicePrincipal";
		_appRoles = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphAppRole"];
		_keyCredentials = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphKeyCredential"];
		_oauth2Permissions = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphOAuth2Permission"];
		_passwordCredentials = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphPasswordCredential"];
		_replyUrls = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphString"];
		_servicePrincipalNames = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphString"];
		_tags = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphString"];
		_appRoleAssignments = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphAppRoleAssignment"];
		_oauth2PermissionGrants = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphOAuth2PermissionGrant"];
		_memberOf = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphDirectoryObject"];
		_createdObjects = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphDirectoryObject"];
		_owners = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphDirectoryObject"];
		_ownedObjects = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphDirectoryObject"];
    }

	return self;
}

- (void)setAccountEnabled:(BOOL ) accountEnabled {
    _accountEnabled = accountEnabled;
    [self valueChangedForBool:accountEnabled forProperty:@"accountEnabled"];
}
    
- (void)setAppDisplayName:(NSString *) appDisplayName {
    _appDisplayName = appDisplayName;
	[self valueChanged:appDisplayName forProperty:@"appDisplayName"];
}
    
- (void)setAppId:(NSString *) appId {
    _appId = appId;
	[self valueChanged:appId forProperty:@"appId"];
}
    
- (void)setAppOwnerTenantId:(NSString *) appOwnerTenantId {
    _appOwnerTenantId = appOwnerTenantId;
	[self valueChanged:appOwnerTenantId forProperty:@"appOwnerTenantId"];
}
    
- (void)setAppRoleAssignmentRequired:(BOOL ) appRoleAssignmentRequired {
    _appRoleAssignmentRequired = appRoleAssignmentRequired;
    [self valueChangedForBool:appRoleAssignmentRequired forProperty:@"appRoleAssignmentRequired"];
}
    
- (void)setAppRoles:(NSMutableArray *) appRoles {
    _appRoles = appRoles;
	[self valueChanged:appRoles forProperty:@"appRoles"];
}
    
- (void)setDisplayName:(NSString *) displayName {
    _displayName = displayName;
	[self valueChanged:displayName forProperty:@"displayName"];
}
    
- (void)setErrorUrl:(NSString *) errorUrl {
    _errorUrl = errorUrl;
	[self valueChanged:errorUrl forProperty:@"errorUrl"];
}
    
- (void)setHomepage:(NSString *) homepage {
    _homepage = homepage;
	[self valueChanged:homepage forProperty:@"homepage"];
}
    
- (void)setKeyCredentials:(NSMutableArray *) keyCredentials {
    _keyCredentials = keyCredentials;
	[self valueChanged:keyCredentials forProperty:@"keyCredentials"];
}
    
- (void)setLogoutUrl:(NSString *) logoutUrl {
    _logoutUrl = logoutUrl;
	[self valueChanged:logoutUrl forProperty:@"logoutUrl"];
}
    
- (void)setOauth2Permissions:(NSMutableArray *) oauth2Permissions {
    _oauth2Permissions = oauth2Permissions;
	[self valueChanged:oauth2Permissions forProperty:@"oauth2Permissions"];
}
    
- (void)setPasswordCredentials:(NSMutableArray *) passwordCredentials {
    _passwordCredentials = passwordCredentials;
	[self valueChanged:passwordCredentials forProperty:@"passwordCredentials"];
}
    
- (void)setPreferredTokenSigningKeyThumbprint:(NSString *) preferredTokenSigningKeyThumbprint {
    _preferredTokenSigningKeyThumbprint = preferredTokenSigningKeyThumbprint;
	[self valueChanged:preferredTokenSigningKeyThumbprint forProperty:@"preferredTokenSigningKeyThumbprint"];
}
    
- (void)setPublisherName:(NSString *) publisherName {
    _publisherName = publisherName;
	[self valueChanged:publisherName forProperty:@"publisherName"];
}
    
- (void)setReplyUrls:(NSMutableArray *) replyUrls {
    _replyUrls = replyUrls;
	[self valueChanged:replyUrls forProperty:@"replyUrls"];
}
    
- (void)setSamlMetadataUrl:(NSString *) samlMetadataUrl {
    _samlMetadataUrl = samlMetadataUrl;
	[self valueChanged:samlMetadataUrl forProperty:@"samlMetadataUrl"];
}
    
- (void)setServicePrincipalNames:(NSMutableArray *) servicePrincipalNames {
    _servicePrincipalNames = servicePrincipalNames;
	[self valueChanged:servicePrincipalNames forProperty:@"servicePrincipalNames"];
}
    
- (void)setTags:(NSMutableArray *) tags {
    _tags = tags;
	[self valueChanged:tags forProperty:@"tags"];
}
    
- (void)setAppRoleAssignedTo:(MSGraphAppRoleAssignment *) appRoleAssignedTo {
    _appRoleAssignedTo = appRoleAssignedTo;
	[self valueChanged:appRoleAssignedTo forProperty:@"appRoleAssignedTo"];
}
    
- (void)setAppRoleAssignments:(NSMutableArray *) appRoleAssignments {
    _appRoleAssignments = appRoleAssignments;
	[self valueChanged:appRoleAssignments forProperty:@"appRoleAssignments"];
}
    
- (void)setOauth2PermissionGrants:(NSMutableArray *) oauth2PermissionGrants {
    _oauth2PermissionGrants = oauth2PermissionGrants;
	[self valueChanged:oauth2PermissionGrants forProperty:@"oauth2PermissionGrants"];
}
    
- (void)setMemberOf:(NSMutableArray *) memberOf {
    _memberOf = memberOf;
	[self valueChanged:memberOf forProperty:@"memberOf"];
}
    
- (void)setCreatedOnBehalfOf:(MSGraphDirectoryObject *) createdOnBehalfOf {
    _createdOnBehalfOf = createdOnBehalfOf;
	[self valueChanged:createdOnBehalfOf forProperty:@"createdOnBehalfOf"];
}
    
- (void)setCreatedObjects:(NSMutableArray *) createdObjects {
    _createdObjects = createdObjects;
	[self valueChanged:createdObjects forProperty:@"createdObjects"];
}
    
- (void)setOwners:(NSMutableArray *) owners {
    _owners = owners;
	[self valueChanged:owners forProperty:@"owners"];
}
    
- (void)setOwnedObjects:(NSMutableArray *) ownedObjects {
    _ownedObjects = ownedObjects;
	[self valueChanged:ownedObjects forProperty:@"ownedObjects"];
}
    
@end