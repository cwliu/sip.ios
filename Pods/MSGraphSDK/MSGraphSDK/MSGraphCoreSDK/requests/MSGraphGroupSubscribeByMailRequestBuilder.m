// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"


@implementation MSGraphGroupSubscribeByMailRequestBuilder

- (MSGraphGroupSubscribeByMailRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphGroupSubscribeByMailRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphGroupSubscribeByMailRequest alloc] initWithURL:self.requestURL client:self.client];
}

@end
