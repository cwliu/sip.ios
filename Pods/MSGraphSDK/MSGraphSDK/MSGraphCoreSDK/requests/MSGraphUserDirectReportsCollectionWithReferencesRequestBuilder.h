// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserDirectReportsCollectionWithReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphUserDirectReportsCollectionReferencesRequestBuilder.h"



@interface MSGraphUserDirectReportsCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserDirectReportsCollectionWithReferencesRequest *)request;

- (MSGraphUserDirectReportsCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;

- (MSGraphUserDirectReportsCollectionReferencesRequestBuilder *) references;

@end
