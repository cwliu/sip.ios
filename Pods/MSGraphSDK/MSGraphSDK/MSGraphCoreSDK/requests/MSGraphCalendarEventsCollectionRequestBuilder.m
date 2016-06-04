// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphCalendarEventsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphCalendarEventsCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphCalendarEventsCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphCalendarEventsCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphEventRequestBuilder *)event:(NSString *)event
{
    return [[MSGraphEventRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:event]
                                                   client:self.client];
}

@end
