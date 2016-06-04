// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphCalendarGroupCalendarsCollectionRequest, MSGraphCalendarRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphCalendarGroupCalendarsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphCalendarGroupCalendarsCollectionRequest *)request;

- (MSGraphCalendarGroupCalendarsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphCalendarRequestBuilder *)calendar:(NSString *)calendar;


@end
