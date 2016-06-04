// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDirectoryRoleTemplatesCollectionRequest, MSGraphDirectoryRoleTemplateRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphDirectoryRoleTemplatesCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDirectoryRoleTemplatesCollectionRequest *)request;

- (MSGraphDirectoryRoleTemplatesCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryRoleTemplateRequestBuilder *)directoryRoleTemplate:(NSString *)directoryRoleTemplate;


@end
