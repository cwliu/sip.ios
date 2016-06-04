// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDrivesCollectionRequest, MSGraphDriveRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphDrivesCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDrivesCollectionRequest *)request;

- (MSGraphDrivesCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDriveRequestBuilder *)drive:(NSString *)drive;


@end
