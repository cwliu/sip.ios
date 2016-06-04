

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphUserCreatedObjectsCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserCreatedObjectsCollectionReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserCreatedObjectsCollectionReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphUserCreatedObjectsCollectionReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}

@end
