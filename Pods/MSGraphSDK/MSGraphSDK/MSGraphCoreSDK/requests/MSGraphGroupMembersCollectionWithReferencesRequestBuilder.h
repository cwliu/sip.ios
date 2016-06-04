// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphGroupMembersCollectionWithReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphGroupMembersCollectionReferencesRequestBuilder.h"



@interface MSGraphGroupMembersCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupMembersCollectionWithReferencesRequest *)request;

- (MSGraphGroupMembersCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;

- (MSGraphGroupMembersCollectionReferencesRequestBuilder *) references;

@end
