// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphOrganizationCollectionRequest, MSGraphOrganizationRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphOrganizationCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphOrganizationCollectionRequest *)request;

- (MSGraphOrganizationCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphOrganizationRequestBuilder *)organization:(NSString *)organization;


@end
