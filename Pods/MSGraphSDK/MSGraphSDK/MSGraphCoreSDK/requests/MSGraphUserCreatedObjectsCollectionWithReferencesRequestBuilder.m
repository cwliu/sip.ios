// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphUserCreatedObjectsCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserCreatedObjectsCollectionWithReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserCreatedObjectsCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphUserCreatedObjectsCollectionWithReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject
{
    return [[MSGraphDirectoryObjectRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:directoryObject]
                                                   client:self.client];
}
- (MSGraphUserCreatedObjectsCollectionReferencesRequestBuilder *) references
{
    return [[MSGraphUserCreatedObjectsCollectionReferencesRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"$ref"] client:self.client];
}

@end
