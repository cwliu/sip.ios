// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphDirectoryObjectGetMemberObjectsRequest;

@interface MSGraphDirectoryObjectGetMemberObjectsRequestBuilder : MSRequestBuilder

- (instancetype)initWithSecurityEnabledOnly:(BOOL)securityEnabledOnly URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphDirectoryObjectGetMemberObjectsRequest *)request;

- (MSGraphDirectoryObjectGetMemberObjectsRequest *)requestWithOptions:(NSArray *)options;

@end
