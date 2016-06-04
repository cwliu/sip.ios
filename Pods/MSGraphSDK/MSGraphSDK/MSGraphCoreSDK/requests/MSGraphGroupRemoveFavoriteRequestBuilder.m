// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"


@implementation MSGraphGroupRemoveFavoriteRequestBuilder

- (MSGraphGroupRemoveFavoriteRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphGroupRemoveFavoriteRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphGroupRemoveFavoriteRequest alloc] initWithURL:self.requestURL client:self.client];
}

@end
