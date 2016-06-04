// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"


@implementation MSGraphMessageCreateForwardRequestBuilder

- (MSGraphMessageCreateForwardRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphMessageCreateForwardRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphMessageCreateForwardRequest alloc] initWithURL:self.requestURL client:self.client];
}

@end
