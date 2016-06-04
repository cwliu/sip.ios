// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphEventInstancesCollectionRequest, MSGraphEventRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphEventInstancesCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphEventInstancesCollectionRequest *)request;

- (MSGraphEventInstancesCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphEventRequestBuilder *)event:(NSString *)event;


@end
