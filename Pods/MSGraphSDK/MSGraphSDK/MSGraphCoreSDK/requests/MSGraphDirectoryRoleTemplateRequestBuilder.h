// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDirectoryRoleTemplateRequest;


#import "MSGraphModels.h"
#import "MSGraphDirectoryObjectRequestBuilder.h"


@interface MSGraphDirectoryRoleTemplateRequestBuilder : MSGraphDirectoryObjectRequestBuilder


- (MSGraphDirectoryRoleTemplateRequest *) request;

- (MSGraphDirectoryRoleTemplateRequest *) requestWithOptions:(NSArray *)options;


@end
