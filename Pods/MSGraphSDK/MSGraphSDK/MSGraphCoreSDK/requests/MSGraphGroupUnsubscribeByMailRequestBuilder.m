// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"


@implementation MSGraphGroupUnsubscribeByMailRequestBuilder

- (MSGraphGroupUnsubscribeByMailRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphGroupUnsubscribeByMailRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphGroupUnsubscribeByMailRequest alloc] initWithURL:self.requestURL client:self.client];
}

@end
