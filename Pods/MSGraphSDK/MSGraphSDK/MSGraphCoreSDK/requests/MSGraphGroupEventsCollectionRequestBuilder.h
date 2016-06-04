// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphGroupEventsCollectionRequest, MSGraphEventRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphGroupEventsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupEventsCollectionRequest *)request;

- (MSGraphGroupEventsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphEventRequestBuilder *)event:(NSString *)event;


@end
