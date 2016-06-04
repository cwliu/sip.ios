// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserCreatedObjectsCollectionWithReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphUserCreatedObjectsCollectionReferencesRequestBuilder.h"



@interface MSGraphUserCreatedObjectsCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserCreatedObjectsCollectionWithReferencesRequest *)request;

- (MSGraphUserCreatedObjectsCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;

- (MSGraphUserCreatedObjectsCollectionReferencesRequestBuilder *) references;

@end
