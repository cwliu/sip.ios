// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphCalendarRequestBuilder

- (MSGraphCalendarEventsCollectionRequestBuilder *)events
{
    return [[MSGraphCalendarEventsCollectionRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"events"]  
                                                                       client:self.client];
}

- (MSGraphEventRequestBuilder *)events:(NSString *)event
{
    return [[self events] event:event];
}

- (MSGraphCalendarCalendarViewCollectionRequestBuilder *)calendarView
{
    return [[MSGraphCalendarCalendarViewCollectionRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"calendarView"]  
                                                                             client:self.client];
}

- (MSGraphEventRequestBuilder *)calendarView:(NSString *)event
{
    return [[self calendarView] event:event];
}


- (MSGraphCalendarRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphCalendarRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphCalendarRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
