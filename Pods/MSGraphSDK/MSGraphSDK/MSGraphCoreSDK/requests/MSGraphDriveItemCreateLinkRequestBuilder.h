// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphDriveItemCreateLinkRequest;

@interface MSGraphDriveItemCreateLinkRequestBuilder : MSRequestBuilder

- (instancetype)initWithType:(NSString *)type scope:(NSString *)scope URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphDriveItemCreateLinkRequest *)request;

- (MSGraphDriveItemCreateLinkRequest *)requestWithOptions:(NSArray *)options;

@end
