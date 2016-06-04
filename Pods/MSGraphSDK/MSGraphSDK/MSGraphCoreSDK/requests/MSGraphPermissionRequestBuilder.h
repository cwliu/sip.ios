// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphPermissionRequest;


#import "MSGraphModels.h"
#import "MSGraphEntityRequestBuilder.h"


@interface MSGraphPermissionRequestBuilder : MSGraphEntityRequestBuilder


- (MSGraphPermissionRequest *) request;

- (MSGraphPermissionRequest *) requestWithOptions:(NSArray *)options;


@end
