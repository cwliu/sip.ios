

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphUserReferenceRequestBuilder


- (MSGraphUserReferenceRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserReferenceRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphUserReferenceRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
