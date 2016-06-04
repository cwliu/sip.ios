// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphGroupOwnersCollectionWithReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphGroupOwnersCollectionReferencesRequestBuilder.h"



@interface MSGraphGroupOwnersCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupOwnersCollectionWithReferencesRequest *)request;

- (MSGraphGroupOwnersCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;

- (MSGraphGroupOwnersCollectionReferencesRequestBuilder *) references;

@end
