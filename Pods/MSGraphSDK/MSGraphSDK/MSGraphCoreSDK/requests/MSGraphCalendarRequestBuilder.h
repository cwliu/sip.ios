// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphCalendarRequest, MSGraphEventRequestBuilder, MSGraphCalendarEventsCollectionRequestBuilder, MSGraphCalendarCalendarViewCollectionRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphEntityRequestBuilder.h"


@interface MSGraphCalendarRequestBuilder : MSGraphEntityRequestBuilder

- (MSGraphCalendarEventsCollectionRequestBuilder *)events;

- (MSGraphEventRequestBuilder *)events:(NSString *)event;

- (MSGraphCalendarCalendarViewCollectionRequestBuilder *)calendarView;

- (MSGraphEventRequestBuilder *)calendarView:(NSString *)event;


- (MSGraphCalendarRequest *) request;

- (MSGraphCalendarRequest *) requestWithOptions:(NSArray *)options;


@end
