// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphMessageForwardRequest;

@interface MSGraphMessageForwardRequestBuilder : MSRequestBuilder

- (instancetype)initWithComment:(NSString *)comment toRecipients:(NSArray *)toRecipients URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphMessageForwardRequest *)request;

- (MSGraphMessageForwardRequest *)requestWithOptions:(NSArray *)options;

@end
