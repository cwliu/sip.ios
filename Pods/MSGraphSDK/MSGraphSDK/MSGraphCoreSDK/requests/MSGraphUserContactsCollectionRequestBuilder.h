// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserContactsCollectionRequest, MSGraphContactRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphUserContactsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserContactsCollectionRequest *)request;

- (MSGraphUserContactsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphContactRequestBuilder *)contact:(NSString *)contact;


@end
