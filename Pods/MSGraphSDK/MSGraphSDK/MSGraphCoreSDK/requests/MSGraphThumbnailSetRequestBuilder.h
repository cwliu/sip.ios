// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphThumbnailSetRequest, MSGraphThumbnailRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphEntityRequestBuilder.h"


@interface MSGraphThumbnailSetRequestBuilder : MSGraphEntityRequestBuilder

- (MSGraphThumbnailRequestBuilder *) large;

- (MSGraphThumbnailRequestBuilder *) medium;

- (MSGraphThumbnailRequestBuilder *) small;

- (MSGraphThumbnailRequestBuilder *) source;


- (MSGraphThumbnailSetRequest *) request;

- (MSGraphThumbnailSetRequest *) requestWithOptions:(NSArray *)options;


@end
