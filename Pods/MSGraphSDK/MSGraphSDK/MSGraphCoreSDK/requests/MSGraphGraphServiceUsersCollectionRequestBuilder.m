// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphUsersCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUsersCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUsersCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphUsersCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphUserRequestBuilder *)user:(NSString *)user
{
    return [[MSGraphUserRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:user]
                                                   client:self.client];
}

@end
