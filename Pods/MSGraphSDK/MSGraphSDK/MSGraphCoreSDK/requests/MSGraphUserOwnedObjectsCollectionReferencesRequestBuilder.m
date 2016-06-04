

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphUserOwnedObjectsCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserOwnedObjectsCollectionReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserOwnedObjectsCollectionReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphUserOwnedObjectsCollectionReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}

@end
