

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserMemberOfCollectionReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphUserMemberOfCollectionReferencesRequestBuilder.h"



@interface MSGraphUserMemberOfCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserMemberOfCollectionReferencesRequest *)request;

- (MSGraphUserMemberOfCollectionReferencesRequest *)requestWithOptions:(NSArray *)options;


@end
