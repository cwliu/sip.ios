// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserMessagesCollectionRequest, MSGraphMessageRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphUserMessagesCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserMessagesCollectionRequest *)request;

- (MSGraphUserMessagesCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphMessageRequestBuilder *)message:(NSString *)message;


@end
