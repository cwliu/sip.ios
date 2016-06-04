// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphGroupRejectedSendersCollectionRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphGroupRejectedSendersCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupRejectedSendersCollectionRequest *)request;

- (MSGraphGroupRejectedSendersCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;


@end
