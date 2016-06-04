// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphUserSendMailRequest;

@interface MSGraphUserSendMailRequestBuilder : MSRequestBuilder

- (instancetype)initWithMessage:(MSGraphMessage *)message saveToSentItems:(BOOL)saveToSentItems URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphUserSendMailRequest *)request;

- (MSGraphUserSendMailRequest *)requestWithOptions:(NSArray *)options;

@end
