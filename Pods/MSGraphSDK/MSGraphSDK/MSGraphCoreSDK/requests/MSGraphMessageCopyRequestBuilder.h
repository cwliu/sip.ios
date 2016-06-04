// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphMessageCopyRequest;

@interface MSGraphMessageCopyRequestBuilder : MSRequestBuilder

- (instancetype)initWithDestinationId:(NSString *)destinationId URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphMessageCopyRequest *)request;

- (MSGraphMessageCopyRequest *)requestWithOptions:(NSArray *)options;

@end
