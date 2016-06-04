// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserMemberOfCollectionWithReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphUserMemberOfCollectionReferencesRequestBuilder.h"



@interface MSGraphUserMemberOfCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserMemberOfCollectionWithReferencesRequest *)request;

- (MSGraphUserMemberOfCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;

- (MSGraphUserMemberOfCollectionReferencesRequestBuilder *) references;

@end
