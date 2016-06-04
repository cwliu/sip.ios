// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphThumbnailRequest, MSGraphThumbnailContentRequest;


#import "MSGraphModels.h"
#import "MSRequestBuilder.h"


@interface MSGraphThumbnailRequestBuilder : MSRequestBuilder

- (MSGraphThumbnailContentRequest *) contentRequestWithOptions:(NSArray *)options;

- (MSGraphThumbnailContentRequest *) contentRequest;


- (MSGraphThumbnailRequest *) request;

- (MSGraphThumbnailRequest *) requestWithOptions:(NSArray *)options;


@end
