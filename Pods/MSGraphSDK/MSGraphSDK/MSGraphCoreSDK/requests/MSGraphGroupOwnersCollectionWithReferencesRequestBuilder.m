// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphGroupOwnersCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupOwnersCollectionWithReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphGroupOwnersCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphGroupOwnersCollectionWithReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject
{
    return [[MSGraphDirectoryObjectRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:directoryObject]
                                                   client:self.client];
}
- (MSGraphGroupOwnersCollectionReferencesRequestBuilder *) references
{
    return [[MSGraphGroupOwnersCollectionReferencesRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"$ref"] client:self.client];
}

@end
