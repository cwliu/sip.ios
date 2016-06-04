// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphDirectoryObjectsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDirectoryObjectsCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDirectoryObjectsCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphDirectoryObjectsCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject
{
    return [[MSGraphDirectoryObjectRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:directoryObject]
                                                   client:self.client];
}

@end
