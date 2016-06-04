

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserOwnedDevicesCollectionReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphUserOwnedDevicesCollectionReferencesRequestBuilder.h"



@interface MSGraphUserOwnedDevicesCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserOwnedDevicesCollectionReferencesRequest *)request;

- (MSGraphUserOwnedDevicesCollectionReferencesRequest *)requestWithOptions:(NSArray *)options;


@end
