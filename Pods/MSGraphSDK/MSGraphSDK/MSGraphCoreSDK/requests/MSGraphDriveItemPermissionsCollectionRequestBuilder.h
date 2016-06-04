// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDriveItemPermissionsCollectionRequest, MSGraphPermissionRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphDriveItemPermissionsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDriveItemPermissionsCollectionRequest *)request;

- (MSGraphDriveItemPermissionsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphPermissionRequestBuilder *)permission:(NSString *)permission;


@end
