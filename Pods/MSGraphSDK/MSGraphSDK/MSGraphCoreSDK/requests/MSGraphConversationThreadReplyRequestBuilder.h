// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphConversationThreadReplyRequest;

@interface MSGraphConversationThreadReplyRequestBuilder : MSRequestBuilder

- (instancetype)initWithPost:(MSGraphPost *)post URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphConversationThreadReplyRequest *)request;

- (MSGraphConversationThreadReplyRequest *)requestWithOptions:(NSArray *)options;

@end
