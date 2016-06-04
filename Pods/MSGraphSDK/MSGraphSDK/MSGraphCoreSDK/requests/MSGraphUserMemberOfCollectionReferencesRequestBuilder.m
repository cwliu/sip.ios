

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphUserMemberOfCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserMemberOfCollectionReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserMemberOfCollectionReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphUserMemberOfCollectionReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}

@end
