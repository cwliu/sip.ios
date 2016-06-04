// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphDirectoryObjectRequestBuilder

- (MSGraphDirectoryObjectCheckMemberGroupsRequestBuilder *)checkMemberGroupsWithGroupIds:(NSArray *)groupIds 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.checkMemberGroups"];
    return [[MSGraphDirectoryObjectCheckMemberGroupsRequestBuilder alloc] initWithGroupIds:groupIds
                                                                                       URL:actionURL
                                                                                    client:self.client];


}

- (MSGraphDirectoryObjectGetMemberGroupsRequestBuilder *)getMemberGroupsWithSecurityEnabledOnly:(BOOL)securityEnabledOnly 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.getMemberGroups"];
    return [[MSGraphDirectoryObjectGetMemberGroupsRequestBuilder alloc] initWithSecurityEnabledOnly:securityEnabledOnly
                                                                                                URL:actionURL
                                                                                             client:self.client];


}

- (MSGraphDirectoryObjectGetMemberObjectsRequestBuilder *)getMemberObjectsWithSecurityEnabledOnly:(BOOL)securityEnabledOnly 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.getMemberObjects"];
    return [[MSGraphDirectoryObjectGetMemberObjectsRequestBuilder alloc] initWithSecurityEnabledOnly:securityEnabledOnly
                                                                                                 URL:actionURL
                                                                                              client:self.client];


}


- (MSGraphDirectoryObjectRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDirectoryObjectRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphDirectoryObjectRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
