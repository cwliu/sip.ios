

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphDirectoryObjectReferenceRequestBuilder


- (MSGraphDirectoryObjectReferenceRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDirectoryObjectReferenceRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphDirectoryObjectReferenceRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
