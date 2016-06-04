// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDriveItemsCollectionRequest, MSGraphDriveItemRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphDriveItemsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDriveItemsCollectionRequest *)request;

- (MSGraphDriveItemsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDriveItemRequestBuilder *)driveItem:(NSString *)driveItem;


@end
