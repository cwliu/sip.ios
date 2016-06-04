// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDriveSpecialCollectionRequest, MSGraphDriveItemRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphDriveSpecialCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDriveSpecialCollectionRequest *)request;

- (MSGraphDriveSpecialCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDriveItemRequestBuilder *)driveItem:(NSString *)driveItem;


@end
