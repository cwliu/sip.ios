// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphSubscribedSkuRequestBuilder


- (MSGraphSubscribedSkuRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphSubscribedSkuRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphSubscribedSkuRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
