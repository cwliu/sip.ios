// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphOrganizationRequest;


#import "MSGraphModels.h"
#import "MSGraphDirectoryObjectRequestBuilder.h"


@interface MSGraphOrganizationRequestBuilder : MSGraphDirectoryObjectRequestBuilder


- (MSGraphOrganizationRequest *) request;

- (MSGraphOrganizationRequest *) requestWithOptions:(NSArray *)options;


@end
