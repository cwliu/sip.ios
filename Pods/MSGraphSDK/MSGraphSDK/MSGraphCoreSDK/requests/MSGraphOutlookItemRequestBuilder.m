// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphOutlookItemRequestBuilder


- (MSGraphOutlookItemRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphOutlookItemRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphOutlookItemRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
