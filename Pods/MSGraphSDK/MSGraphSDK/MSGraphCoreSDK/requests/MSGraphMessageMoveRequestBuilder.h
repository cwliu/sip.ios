// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphMessageMoveRequest;

@interface MSGraphMessageMoveRequestBuilder : MSRequestBuilder

- (instancetype)initWithDestinationId:(NSString *)destinationId URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphMessageMoveRequest *)request;

- (MSGraphMessageMoveRequest *)requestWithOptions:(NSArray *)options;

@end
