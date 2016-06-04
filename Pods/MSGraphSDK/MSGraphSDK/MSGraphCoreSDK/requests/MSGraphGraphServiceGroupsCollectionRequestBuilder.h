// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphGroupsCollectionRequest, MSGraphGroupRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphGroupsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupsCollectionRequest *)request;

- (MSGraphGroupsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphGroupRequestBuilder *)group:(NSString *)group;


@end
