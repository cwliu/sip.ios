

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphUserOwnedDevicesCollectionReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserOwnedDevicesCollectionReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserOwnedDevicesCollectionReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphUserOwnedDevicesCollectionReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}

@end
