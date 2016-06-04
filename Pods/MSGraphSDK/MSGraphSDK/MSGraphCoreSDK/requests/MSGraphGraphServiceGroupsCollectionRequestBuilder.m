// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphGroupsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupsCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphGroupsCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphGroupsCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphGroupRequestBuilder *)group:(NSString *)group
{
    return [[MSGraphGroupRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:group]
                                                   client:self.client];
}

@end
