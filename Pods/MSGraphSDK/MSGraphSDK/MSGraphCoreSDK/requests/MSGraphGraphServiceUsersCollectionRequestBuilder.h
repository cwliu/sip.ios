// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUsersCollectionRequest, MSGraphUserRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphUsersCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUsersCollectionRequest *)request;

- (MSGraphUsersCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphUserRequestBuilder *)user:(NSString *)user;


@end
