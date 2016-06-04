// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphPostForwardRequest;

@interface MSGraphPostForwardRequestBuilder : MSRequestBuilder

- (instancetype)initWithComment:(NSString *)comment toRecipients:(NSArray *)toRecipients URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphPostForwardRequest *)request;

- (MSGraphPostForwardRequest *)requestWithOptions:(NSArray *)options;

@end
