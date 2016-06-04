// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphCalendarGroupRequestBuilder

- (MSGraphCalendarGroupCalendarsCollectionRequestBuilder *)calendars
{
    return [[MSGraphCalendarGroupCalendarsCollectionRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"calendars"]  
                                                                               client:self.client];
}

- (MSGraphCalendarRequestBuilder *)calendars:(NSString *)calendar
{
    return [[self calendars] calendar:calendar];
}


- (MSGraphCalendarGroupRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphCalendarGroupRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphCalendarGroupRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
