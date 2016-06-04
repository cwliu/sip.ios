

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphDirectoryRoleMembersCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDirectoryRoleMembersCollectionReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDirectoryRoleMembersCollectionReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphDirectoryRoleMembersCollectionReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}

@end
