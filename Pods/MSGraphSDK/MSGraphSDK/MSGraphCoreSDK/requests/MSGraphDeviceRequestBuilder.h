// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDeviceRequest, MSGraphDirectoryObjectRequestBuilder, MSGraphDeviceRegisteredOwnersCollectionWithReferencesRequestBuilder, MSGraphDeviceRegisteredUsersCollectionWithReferencesRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphDirectoryObjectRequestBuilder.h"


@interface MSGraphDeviceRequestBuilder : MSGraphDirectoryObjectRequestBuilder

- (MSGraphDeviceRegisteredOwnersCollectionWithReferencesRequestBuilder *)registeredOwners;

- (MSGraphDirectoryObjectRequestBuilder *)registeredOwners:(NSString *)directoryObject;

- (MSGraphDeviceRegisteredUsersCollectionWithReferencesRequestBuilder *)registeredUsers;

- (MSGraphDirectoryObjectRequestBuilder *)registeredUsers:(NSString *)directoryObject;


- (MSGraphDeviceRequest *) request;

- (MSGraphDeviceRequest *) requestWithOptions:(NSArray *)options;


@end
