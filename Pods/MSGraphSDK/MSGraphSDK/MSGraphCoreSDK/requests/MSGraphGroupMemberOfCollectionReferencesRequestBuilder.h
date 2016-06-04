

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphGroupMemberOfCollectionReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphGroupMemberOfCollectionReferencesRequestBuilder.h"



@interface MSGraphGroupMemberOfCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupMemberOfCollectionReferencesRequest *)request;

- (MSGraphGroupMemberOfCollectionReferencesRequest *)requestWithOptions:(NSArray *)options;


@end
