// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDeviceRegisteredUsersCollectionWithReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphDeviceRegisteredUsersCollectionReferencesRequestBuilder.h"



@interface MSGraphDeviceRegisteredUsersCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDeviceRegisteredUsersCollectionWithReferencesRequest *)request;

- (MSGraphDeviceRegisteredUsersCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;

- (MSGraphDeviceRegisteredUsersCollectionReferencesRequestBuilder *) references;

@end
