// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"


@implementation MSGraphMessageSendRequestBuilder

- (MSGraphMessageSendRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphMessageSendRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphMessageSendRequest alloc] initWithURL:self.requestURL client:self.client];
}

@end
