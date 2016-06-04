// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserCalendarsCollectionRequest, MSGraphCalendarRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphUserCalendarsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserCalendarsCollectionRequest *)request;

- (MSGraphUserCalendarsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphCalendarRequestBuilder *)calendar:(NSString *)calendar;


@end
