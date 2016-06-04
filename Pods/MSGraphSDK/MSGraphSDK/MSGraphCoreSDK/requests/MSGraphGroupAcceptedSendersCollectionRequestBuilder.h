// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphGroupAcceptedSendersCollectionRequest, MSGraphDirectoryObjectRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphGroupAcceptedSendersCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupAcceptedSendersCollectionRequest *)request;

- (MSGraphGroupAcceptedSendersCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject;


@end
