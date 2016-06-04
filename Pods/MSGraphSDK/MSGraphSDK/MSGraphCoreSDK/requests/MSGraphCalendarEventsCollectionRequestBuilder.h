// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphCalendarEventsCollectionRequest, MSGraphEventRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphCalendarEventsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphCalendarEventsCollectionRequest *)request;

- (MSGraphCalendarEventsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphEventRequestBuilder *)event:(NSString *)event;


@end
