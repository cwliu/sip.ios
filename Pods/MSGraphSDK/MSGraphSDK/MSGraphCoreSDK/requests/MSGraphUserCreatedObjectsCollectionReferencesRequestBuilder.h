

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserCreatedObjectsCollectionReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphUserCreatedObjectsCollectionReferencesRequestBuilder.h"



@interface MSGraphUserCreatedObjectsCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserCreatedObjectsCollectionReferencesRequest *)request;

- (MSGraphUserCreatedObjectsCollectionReferencesRequest *)requestWithOptions:(NSArray *)options;


@end
