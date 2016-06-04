// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphUserMemberOfCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserMemberOfCollectionWithReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserMemberOfCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphUserMemberOfCollectionWithReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject
{
    return [[MSGraphDirectoryObjectRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:directoryObject]
                                                   client:self.client];
}
- (MSGraphUserMemberOfCollectionReferencesRequestBuilder *) references
{
    return [[MSGraphUserMemberOfCollectionReferencesRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"$ref"] client:self.client];
}

@end
