

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserOwnedObjectsCollectionReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphUserOwnedObjectsCollectionReferencesRequestBuilder.h"



@interface MSGraphUserOwnedObjectsCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserOwnedObjectsCollectionReferencesRequest *)request;

- (MSGraphUserOwnedObjectsCollectionReferencesRequest *)requestWithOptions:(NSArray *)options;


@end
