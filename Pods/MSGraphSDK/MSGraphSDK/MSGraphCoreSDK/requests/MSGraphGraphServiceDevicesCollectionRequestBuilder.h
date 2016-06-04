// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDevicesCollectionRequest, MSGraphDeviceRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphDevicesCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDevicesCollectionRequest *)request;

- (MSGraphDevicesCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDeviceRequestBuilder *)device:(NSString *)device;


@end
