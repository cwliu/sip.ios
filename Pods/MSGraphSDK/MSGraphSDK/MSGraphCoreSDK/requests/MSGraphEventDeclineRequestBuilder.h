// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphEventDeclineRequest;

@interface MSGraphEventDeclineRequestBuilder : MSRequestBuilder

- (instancetype)initWithComment:(NSString *)comment sendResponse:(BOOL)sendResponse URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphEventDeclineRequest *)request;

- (MSGraphEventDeclineRequest *)requestWithOptions:(NSArray *)options;

@end
