// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphDirectoryRolesCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDirectoryRolesCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDirectoryRolesCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphDirectoryRolesCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDirectoryRoleRequestBuilder *)directoryRole:(NSString *)directoryRole
{
    return [[MSGraphDirectoryRoleRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:directoryRole]
                                                   client:self.client];
}

@end
