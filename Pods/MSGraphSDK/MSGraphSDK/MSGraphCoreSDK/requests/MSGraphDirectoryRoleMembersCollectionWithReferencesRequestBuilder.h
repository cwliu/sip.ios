// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDirectoryRoleMembersCollectionWithReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphDirectoryRoleMembersCollectionReferencesRequestBuilder.h"



@interface MSGraphDirectoryRoleMembersCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDirectoryRoleMembersCollectionWithReferencesRequest *)request;

- (MSGraphDirectoryRoleMembersCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;

- (MSGraphDirectoryRoleMembersCollectionReferencesRequestBuilder *) references;

@end
