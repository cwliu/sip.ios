// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDirectoryRolesCollectionRequest, MSGraphDirectoryRoleRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphDirectoryRolesCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDirectoryRolesCollectionRequest *)request;

- (MSGraphDirectoryRolesCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryRoleRequestBuilder *)directoryRole:(NSString *)directoryRole;


@end
