

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphGroupMembersCollectionReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphGroupMembersCollectionReferencesRequestBuilder.h"



@interface MSGraphGroupMembersCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupMembersCollectionReferencesRequest *)request;

- (MSGraphGroupMembersCollectionReferencesRequest *)requestWithOptions:(NSArray *)options;


@end
