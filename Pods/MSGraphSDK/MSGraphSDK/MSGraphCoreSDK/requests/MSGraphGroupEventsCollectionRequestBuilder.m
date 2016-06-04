// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphGroupEventsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupEventsCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphGroupEventsCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphGroupEventsCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphEventRequestBuilder *)event:(NSString *)event
{
    return [[MSGraphEventRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:event]
                                                   client:self.client];
}

@end
