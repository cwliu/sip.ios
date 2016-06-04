// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphSubscribedSkuRequest;


#import "MSGraphModels.h"
#import "MSGraphEntityRequestBuilder.h"


@interface MSGraphSubscribedSkuRequestBuilder : MSGraphEntityRequestBuilder


- (MSGraphSubscribedSkuRequest *) request;

- (MSGraphSubscribedSkuRequest *) requestWithOptions:(NSArray *)options;


@end
