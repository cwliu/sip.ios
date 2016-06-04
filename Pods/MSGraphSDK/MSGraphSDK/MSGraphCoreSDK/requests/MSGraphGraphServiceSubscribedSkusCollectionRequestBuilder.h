// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphSubscribedSkusCollectionRequest, MSGraphSubscribedSkuRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphSubscribedSkusCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphSubscribedSkusCollectionRequest *)request;

- (MSGraphSubscribedSkusCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphSubscribedSkuRequestBuilder *)subscribedSku:(NSString *)subscribedSku;


@end
