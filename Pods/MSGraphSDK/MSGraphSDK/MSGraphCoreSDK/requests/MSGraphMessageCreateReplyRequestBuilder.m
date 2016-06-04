// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"


@implementation MSGraphMessageCreateReplyRequestBuilder

- (MSGraphMessageCreateReplyRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphMessageCreateReplyRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphMessageCreateReplyRequest alloc] initWithURL:self.requestURL client:self.client];
}

@end
