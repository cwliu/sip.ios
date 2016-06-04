// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"


@implementation MSGraphMessageCreateReplyAllRequestBuilder

- (MSGraphMessageCreateReplyAllRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphMessageCreateReplyAllRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphMessageCreateReplyAllRequest alloc] initWithURL:self.requestURL client:self.client];
}

@end
