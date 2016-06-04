// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDriveItemChildrenCollectionRequest, MSGraphDriveItemRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphDriveItemChildrenCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDriveItemChildrenCollectionRequest *)request;

- (MSGraphDriveItemChildrenCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDriveItemRequestBuilder *)driveItem:(NSString *)driveItem;


@end
