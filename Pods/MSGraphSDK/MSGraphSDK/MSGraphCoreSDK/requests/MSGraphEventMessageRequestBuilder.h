// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphEventMessageRequest, MSGraphEventRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphMessageRequestBuilder.h"


@interface MSGraphEventMessageRequestBuilder : MSGraphMessageRequestBuilder

- (MSGraphEventRequestBuilder *) event;


- (MSGraphEventMessageRequest *) request;

- (MSGraphEventMessageRequest *) requestWithOptions:(NSArray *)options;


@end
