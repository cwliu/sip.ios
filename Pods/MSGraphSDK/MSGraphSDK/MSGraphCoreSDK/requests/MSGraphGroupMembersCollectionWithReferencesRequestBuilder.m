// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphGroupMembersCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupMembersCollectionWithReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphGroupMembersCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphGroupMembersCollectionWithReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject
{
    return [[MSGraphDirectoryObjectRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:directoryObject]
                                                   client:self.client];
}
- (MSGraphGroupMembersCollectionReferencesRequestBuilder *) references
{
    return [[MSGraphGroupMembersCollectionReferencesRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"$ref"] client:self.client];
}

@end
