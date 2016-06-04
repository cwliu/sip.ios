// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"


@implementation MSGraphGroupAddFavoriteRequestBuilder

- (MSGraphGroupAddFavoriteRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphGroupAddFavoriteRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphGroupAddFavoriteRequest alloc] initWithURL:self.requestURL client:self.client];
}

@end
