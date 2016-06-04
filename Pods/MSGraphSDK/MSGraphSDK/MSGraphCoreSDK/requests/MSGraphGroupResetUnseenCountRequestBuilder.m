// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"


@implementation MSGraphGroupResetUnseenCountRequestBuilder

- (MSGraphGroupResetUnseenCountRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphGroupResetUnseenCountRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphGroupResetUnseenCountRequest alloc] initWithURL:self.requestURL client:self.client];
}

@end
