

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphGroupMembersCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupMembersCollectionReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphGroupMembersCollectionReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphGroupMembersCollectionReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}

@end
