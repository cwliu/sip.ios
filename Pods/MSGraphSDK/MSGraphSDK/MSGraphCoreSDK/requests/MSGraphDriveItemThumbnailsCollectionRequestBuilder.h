// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDriveItemThumbnailsCollectionRequest, MSGraphThumbnailSetRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphDriveItemThumbnailsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDriveItemThumbnailsCollectionRequest *)request;

- (MSGraphDriveItemThumbnailsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphThumbnailSetRequestBuilder *)thumbnailSet:(NSString *)thumbnailSet;


@end
