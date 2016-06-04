

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserRegisteredDevicesCollectionReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphUserRegisteredDevicesCollectionReferencesRequestBuilder.h"



@interface MSGraphUserRegisteredDevicesCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserRegisteredDevicesCollectionReferencesRequest *)request;

- (MSGraphUserRegisteredDevicesCollectionReferencesRequest *)requestWithOptions:(NSArray *)options;


@end
