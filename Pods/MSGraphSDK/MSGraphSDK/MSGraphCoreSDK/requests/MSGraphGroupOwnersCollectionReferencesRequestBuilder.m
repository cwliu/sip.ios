

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphGroupOwnersCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupOwnersCollectionReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphGroupOwnersCollectionReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphGroupOwnersCollectionReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}

@end
