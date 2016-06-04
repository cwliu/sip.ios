// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphDriveItemCopyRequest;

@interface MSGraphDriveItemCopyRequestBuilder : MSRequestBuilder

- (instancetype)initWithName:(NSString *)name parentReference:(MSGraphItemReference *)parentReference URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphDriveItemCopyRequest *)request;

- (MSGraphDriveItemCopyRequest *)requestWithOptions:(NSArray *)options;

@end
