// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphSubscribedSkusCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphSubscribedSkusCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphSubscribedSkusCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphSubscribedSkusCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphSubscribedSkuRequestBuilder *)subscribedSku:(NSString *)subscribedSku
{
    return [[MSGraphSubscribedSkuRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:subscribedSku]
                                                   client:self.client];
}

@end
