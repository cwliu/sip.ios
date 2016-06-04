// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphClient


-(MSGraphDirectoryObjectsCollectionRequestBuilder *)directoryObjects
{
    return [[MSGraphDirectoryObjectsCollectionRequestBuilder alloc] initWithURL:[self.baseURL URLByAppendingPathComponent:@"directoryObjects"] 
                                                                       client:self];
}

-(MSGraphDirectoryObjectRequestBuilder*)directoryObjects:(NSString*)directoryObject
{
    return [[self directoryObjects] directoryObject:directoryObject];
}


-(MSGraphDevicesCollectionRequestBuilder *)devices
{
    return [[MSGraphDevicesCollectionRequestBuilder alloc] initWithURL:[self.baseURL URLByAppendingPathComponent:@"devices"] 
                                                              client:self];
}

-(MSGraphDeviceRequestBuilder*)devices:(NSString*)device
{
    return [[self devices] device:device];
}


-(MSGraphGroupsCollectionRequestBuilder *)groups
{
    return [[MSGraphGroupsCollectionRequestBuilder alloc] initWithURL:[self.baseURL URLByAppendingPathComponent:@"groups"] 
                                                             client:self];
}

-(MSGraphGroupRequestBuilder*)groups:(NSString*)group
{
    return [[self groups] group:group];
}


-(MSGraphDirectoryRolesCollectionRequestBuilder *)directoryRoles
{
    return [[MSGraphDirectoryRolesCollectionRequestBuilder alloc] initWithURL:[self.baseURL URLByAppendingPathComponent:@"directoryRoles"] 
                                                                     client:self];
}

-(MSGraphDirectoryRoleRequestBuilder*)directoryRoles:(NSString*)directoryRole
{
    return [[self directoryRoles] directoryRole:directoryRole];
}


-(MSGraphDirectoryRoleTemplatesCollectionRequestBuilder *)directoryRoleTemplates
{
    return [[MSGraphDirectoryRoleTemplatesCollectionRequestBuilder alloc] initWithURL:[self.baseURL URLByAppendingPathComponent:@"directoryRoleTemplates"] 
                                                                             client:self];
}

-(MSGraphDirectoryRoleTemplateRequestBuilder*)directoryRoleTemplates:(NSString*)directoryRoleTemplate
{
    return [[self directoryRoleTemplates] directoryRoleTemplate:directoryRoleTemplate];
}


-(MSGraphOrganizationCollectionRequestBuilder *)organization
{
    return [[MSGraphOrganizationCollectionRequestBuilder alloc] initWithURL:[self.baseURL URLByAppendingPathComponent:@"organization"] 
                                                                    client:self];
}

-(MSGraphOrganizationRequestBuilder*)organization:(NSString*)organization
{
    return [[self organization] organization:organization];
}


-(MSGraphSubscribedSkusCollectionRequestBuilder *)subscribedSkus
{
    return [[MSGraphSubscribedSkusCollectionRequestBuilder alloc] initWithURL:[self.baseURL URLByAppendingPathComponent:@"subscribedSkus"] 
                                                                     client:self];
}

-(MSGraphSubscribedSkuRequestBuilder*)subscribedSkus:(NSString*)subscribedSku
{
    return [[self subscribedSkus] subscribedSku:subscribedSku];
}


-(MSGraphUsersCollectionRequestBuilder *)users
{
    return [[MSGraphUsersCollectionRequestBuilder alloc] initWithURL:[self.baseURL URLByAppendingPathComponent:@"users"] 
                                                            client:self];
}

-(MSGraphUserRequestBuilder*)users:(NSString*)user
{
    return [[self users] user:user];
}


-(MSGraphDrivesCollectionRequestBuilder *)drives
{
    return [[MSGraphDrivesCollectionRequestBuilder alloc] initWithURL:[self.baseURL URLByAppendingPathComponent:@"drives"] 
                                                             client:self];
}

-(MSGraphDriveRequestBuilder*)drives:(NSString*)drive
{
    return [[self drives] drive:drive];
}

    -(MSGraphUserRequestBuilder *) me
    {
    return [[MSGraphUserRequestBuilder alloc] initWithURL:[self.baseURL URLByAppendingPathComponent:@"me"] 
                                                  client:self];
    }
    -(MSGraphDriveRequestBuilder *) drive
    {
    return [[MSGraphDriveRequestBuilder alloc] initWithURL:[self.baseURL URLByAppendingPathComponent:@"drive"] 
                                                   client:self];
    }

@end
