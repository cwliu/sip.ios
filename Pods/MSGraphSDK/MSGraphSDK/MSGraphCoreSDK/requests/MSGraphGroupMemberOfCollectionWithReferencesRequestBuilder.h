// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphGroupMemberOfCollectionWithReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphGroupMemberOfCollectionReferencesRequestBuilder.h"



@interface MSGraphGroupMemberOfCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupMemberOfCollectionWithReferencesRequest *)request;

- (MSGraphGroupMemberOfCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;

- (MSGraphGroupMemberOfCollectionReferencesRequestBuilder *) references;

@end
