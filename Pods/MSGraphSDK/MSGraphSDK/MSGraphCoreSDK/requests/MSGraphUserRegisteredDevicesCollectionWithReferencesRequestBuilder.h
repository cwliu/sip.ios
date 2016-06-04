// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserRegisteredDevicesCollectionWithReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphUserRegisteredDevicesCollectionReferencesRequestBuilder.h"



@interface MSGraphUserRegisteredDevicesCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserRegisteredDevicesCollectionWithReferencesRequest *)request;

- (MSGraphUserRegisteredDevicesCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;

- (MSGraphUserRegisteredDevicesCollectionReferencesRequestBuilder *) references;

@end
