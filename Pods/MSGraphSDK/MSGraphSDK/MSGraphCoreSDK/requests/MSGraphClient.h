// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDirectoryObjectsCollectionRequestBuilder;
@class MSGraphDirectoryObjectRequestBuilder;
@class MSGraphDevicesCollectionRequestBuilder;
@class MSGraphDeviceRequestBuilder;
@class MSGraphGroupsCollectionRequestBuilder;
@class MSGraphGroupRequestBuilder;
@class MSGraphDirectoryRolesCollectionRequestBuilder;
@class MSGraphDirectoryRoleRequestBuilder;
@class MSGraphDirectoryRoleTemplatesCollectionRequestBuilder;
@class MSGraphDirectoryRoleTemplateRequestBuilder;
@class MSGraphOrganizationCollectionRequestBuilder;
@class MSGraphOrganizationRequestBuilder;
@class MSGraphSubscribedSkusCollectionRequestBuilder;
@class MSGraphSubscribedSkuRequestBuilder;
@class MSGraphUsersCollectionRequestBuilder;
@class MSGraphUserRequestBuilder;
@class MSGraphDrivesCollectionRequestBuilder;
@class MSGraphDriveRequestBuilder;
@class MSGraphMeCollectionRequestBuilder;
@class MSGraphUserRequestBuilder;
@class MSGraphDriveCollectionRequestBuilder;
@class MSGraphDriveRequestBuilder;

#import "ODataBaseClient.h"
#import "MSGraphModels.h"
#import "MSHttpProvider.h"
#import "MSAuthenticationProvider.h"
#import "MSLoggerProtocol.h"

/**
* The header for type MSGraphClient.
*/

@interface MSGraphClient : ODataBaseClient

-(MSGraphDirectoryObjectsCollectionRequestBuilder *)directoryObjects;

-(MSGraphDirectoryObjectRequestBuilder *)directoryObjects:(NSString*)directoryObjectsId;

-(MSGraphDevicesCollectionRequestBuilder *)devices;

-(MSGraphDeviceRequestBuilder *)devices:(NSString*)devicesId;

-(MSGraphGroupsCollectionRequestBuilder *)groups;

-(MSGraphGroupRequestBuilder *)groups:(NSString*)groupsId;

-(MSGraphDirectoryRolesCollectionRequestBuilder *)directoryRoles;

-(MSGraphDirectoryRoleRequestBuilder *)directoryRoles:(NSString*)directoryRolesId;

-(MSGraphDirectoryRoleTemplatesCollectionRequestBuilder *)directoryRoleTemplates;

-(MSGraphDirectoryRoleTemplateRequestBuilder *)directoryRoleTemplates:(NSString*)directoryRoleTemplatesId;

-(MSGraphOrganizationCollectionRequestBuilder *)organization;

-(MSGraphOrganizationRequestBuilder *)organization:(NSString*)organizationId;

-(MSGraphSubscribedSkusCollectionRequestBuilder *)subscribedSkus;

-(MSGraphSubscribedSkuRequestBuilder *)subscribedSkus:(NSString*)subscribedSkusId;

-(MSGraphUsersCollectionRequestBuilder *)users;

-(MSGraphUserRequestBuilder *)users:(NSString*)usersId;

-(MSGraphDrivesCollectionRequestBuilder *)drives;

-(MSGraphDriveRequestBuilder *)drives:(NSString*)drivesId;

-(MSGraphUserRequestBuilder *) me;
-(MSGraphDriveRequestBuilder *) drive;

@end
