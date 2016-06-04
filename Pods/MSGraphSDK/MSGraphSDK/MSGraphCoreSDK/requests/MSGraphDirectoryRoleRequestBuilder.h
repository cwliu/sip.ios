// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDirectoryRoleRequest, MSGraphDirectoryObjectRequestBuilder, MSGraphDirectoryRoleMembersCollectionWithReferencesRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphDirectoryObjectRequestBuilder.h"


@interface MSGraphDirectoryRoleRequestBuilder : MSGraphDirectoryObjectRequestBuilder

- (MSGraphDirectoryRoleMembersCollectionWithReferencesRequestBuilder *)members;

- (MSGraphDirectoryObjectRequestBuilder *)members:(NSString *)directoryObject;


- (MSGraphDirectoryRoleRequest *) request;

- (MSGraphDirectoryRoleRequest *) requestWithOptions:(NSArray *)options;


@end
