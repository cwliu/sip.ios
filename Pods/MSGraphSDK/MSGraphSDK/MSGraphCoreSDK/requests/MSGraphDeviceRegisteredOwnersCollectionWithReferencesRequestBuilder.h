// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDeviceRegisteredOwnersCollectionWithReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphDeviceRegisteredOwnersCollectionReferencesRequestBuilder.h"



@interface MSGraphDeviceRegisteredOwnersCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDeviceRegisteredOwnersCollectionWithReferencesRequest *)request;

- (MSGraphDeviceRegisteredOwnersCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;

- (MSGraphDeviceRegisteredOwnersCollectionReferencesRequestBuilder *) references;

@end
