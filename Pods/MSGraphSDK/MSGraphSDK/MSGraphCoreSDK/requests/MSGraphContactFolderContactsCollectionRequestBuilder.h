// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphContactFolderContactsCollectionRequest, MSGraphContactRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphContactFolderContactsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphContactFolderContactsCollectionRequest *)request;

- (MSGraphContactFolderContactsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphContactRequestBuilder *)contact:(NSString *)contact;


@end
