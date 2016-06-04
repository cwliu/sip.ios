// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphUserAssignLicenseRequest;

@interface MSGraphUserAssignLicenseRequestBuilder : MSRequestBuilder

- (instancetype)initWithAddLicenses:(NSArray *)addLicenses removeLicenses:(NSArray *)removeLicenses URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphUserAssignLicenseRequest *)request;

- (MSGraphUserAssignLicenseRequest *)requestWithOptions:(NSArray *)options;

@end
