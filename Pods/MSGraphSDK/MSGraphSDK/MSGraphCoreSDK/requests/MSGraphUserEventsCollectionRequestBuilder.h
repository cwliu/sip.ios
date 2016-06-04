// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserEventsCollectionRequest, MSGraphEventRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphUserEventsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserEventsCollectionRequest *)request;

- (MSGraphUserEventsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphEventRequestBuilder *)event:(NSString *)event;


@end
