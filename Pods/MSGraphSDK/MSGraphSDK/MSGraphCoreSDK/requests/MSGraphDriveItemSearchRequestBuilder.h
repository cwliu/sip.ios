// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphDriveItemSearchRequest;

@interface MSGraphDriveItemSearchRequestBuilder : MSRequestBuilder

- (instancetype)initWithQ:(NSString *)q URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphDriveItemSearchRequest *)request;

- (MSGraphDriveItemSearchRequest *)requestWithOptions:(NSArray *)options;

@end
