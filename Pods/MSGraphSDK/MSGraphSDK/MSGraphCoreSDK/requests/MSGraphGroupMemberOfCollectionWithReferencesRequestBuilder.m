// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphGroupMemberOfCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupMemberOfCollectionWithReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphGroupMemberOfCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphGroupMemberOfCollectionWithReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject
{
    return [[MSGraphDirectoryObjectRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:directoryObject]
                                                   client:self.client];
}
- (MSGraphGroupMemberOfCollectionReferencesRequestBuilder *) references
{
    return [[MSGraphGroupMemberOfCollectionReferencesRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"$ref"] client:self.client];
}

@end
