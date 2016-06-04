

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphGroupOwnersCollectionReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphGroupOwnersCollectionReferencesRequestBuilder.h"



@interface MSGraphGroupOwnersCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupOwnersCollectionReferencesRequest *)request;

- (MSGraphGroupOwnersCollectionReferencesRequest *)requestWithOptions:(NSArray *)options;


@end
