// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphDirectoryRoleRequestBuilder

- (MSGraphDirectoryRoleMembersCollectionWithReferencesRequestBuilder *)members
{
    return [[MSGraphDirectoryRoleMembersCollectionWithReferencesRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"members"]  
                                                                                           client:self.client];
}

- (MSGraphDirectoryObjectRequestBuilder *)members:(NSString *)directoryObject
{
    return [[self members] directoryObject:directoryObject];
}


- (MSGraphDirectoryRoleRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDirectoryRoleRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphDirectoryRoleRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
