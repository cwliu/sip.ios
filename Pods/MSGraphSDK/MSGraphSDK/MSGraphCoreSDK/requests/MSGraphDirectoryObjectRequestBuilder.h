// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDirectoryObjectRequest, MSGraphDirectoryObjectCheckMemberGroupsRequestBuilder, MSGraphDirectoryObjectGetMemberGroupsRequestBuilder, MSGraphDirectoryObjectGetMemberObjectsRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphEntityRequestBuilder.h"


@interface MSGraphDirectoryObjectRequestBuilder : MSGraphEntityRequestBuilder

- (MSGraphDirectoryObjectCheckMemberGroupsRequestBuilder *)checkMemberGroupsWithGroupIds:(NSArray *)groupIds ;



- (MSGraphDirectoryObjectGetMemberGroupsRequestBuilder *)getMemberGroupsWithSecurityEnabledOnly:(BOOL)securityEnabledOnly ;



- (MSGraphDirectoryObjectGetMemberObjectsRequestBuilder *)getMemberObjectsWithSecurityEnabledOnly:(BOOL)securityEnabledOnly ;




- (MSGraphDirectoryObjectRequest *) request;

- (MSGraphDirectoryObjectRequest *) requestWithOptions:(NSArray *)options;


@end
