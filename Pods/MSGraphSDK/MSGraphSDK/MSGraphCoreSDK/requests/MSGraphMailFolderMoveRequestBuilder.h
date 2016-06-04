// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphMailFolderMoveRequest;

@interface MSGraphMailFolderMoveRequestBuilder : MSRequestBuilder

- (instancetype)initWithDestinationId:(NSString *)destinationId URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphMailFolderMoveRequest *)request;

- (MSGraphMailFolderMoveRequest *)requestWithOptions:(NSArray *)options;

@end
