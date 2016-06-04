// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphCalendarGroupCalendarsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphCalendarGroupCalendarsCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphCalendarGroupCalendarsCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphCalendarGroupCalendarsCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphCalendarRequestBuilder *)calendar:(NSString *)calendar
{
    return [[MSGraphCalendarRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:calendar]
                                                   client:self.client];
}

@end
