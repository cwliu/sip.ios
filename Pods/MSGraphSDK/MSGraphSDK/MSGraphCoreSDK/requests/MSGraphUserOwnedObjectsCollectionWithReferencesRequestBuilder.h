// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserOwnedObjectsCollectionWithReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphUserOwnedObjectsCollectionReferencesRequestBuilder.h"



@interface MSGraphUserOwnedObjectsCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserOwnedObjectsCollectionWithReferencesRequest *)request;

- (MSGraphUserOwnedObjectsCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;

- (MSGraphUserOwnedObjectsCollectionReferencesRequestBuilder *) references;

@end
