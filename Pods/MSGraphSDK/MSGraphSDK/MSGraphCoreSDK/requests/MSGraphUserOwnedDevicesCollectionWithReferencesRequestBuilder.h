// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserOwnedDevicesCollectionWithReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphUserOwnedDevicesCollectionReferencesRequestBuilder.h"



@interface MSGraphUserOwnedDevicesCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserOwnedDevicesCollectionWithReferencesRequest *)request;

- (MSGraphUserOwnedDevicesCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;

- (MSGraphUserOwnedDevicesCollectionReferencesRequestBuilder *) references;

@end
