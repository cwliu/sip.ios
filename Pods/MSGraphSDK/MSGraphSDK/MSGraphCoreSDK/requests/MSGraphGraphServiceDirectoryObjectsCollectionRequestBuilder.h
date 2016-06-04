// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDirectoryObjectsCollectionRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphDirectoryObjectsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDirectoryObjectsCollectionRequest *)request;

- (MSGraphDirectoryObjectsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;


@end
