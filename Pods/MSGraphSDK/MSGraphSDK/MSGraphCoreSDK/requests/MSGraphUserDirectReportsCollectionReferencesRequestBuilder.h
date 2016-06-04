

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserDirectReportsCollectionReferencesRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"

#import "MSGraphUserDirectReportsCollectionReferencesRequestBuilder.h"



@interface MSGraphUserDirectReportsCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserDirectReportsCollectionReferencesRequest *)request;

- (MSGraphUserDirectReportsCollectionReferencesRequest *)requestWithOptions:(NSArray *)options;


@end
