// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphDirectoryObjectCheckMemberGroupsRequest;

@interface MSGraphDirectoryObjectCheckMemberGroupsRequestBuilder : MSRequestBuilder

- (instancetype)initWithGroupIds:(NSArray *)groupIds URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphDirectoryObjectCheckMemberGroupsRequest *)request;

- (MSGraphDirectoryObjectCheckMemberGroupsRequest *)requestWithOptions:(NSArray *)options;

@end
