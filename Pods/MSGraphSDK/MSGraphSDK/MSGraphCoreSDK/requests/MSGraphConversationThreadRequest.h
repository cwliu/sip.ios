// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
@class MSGraphPostRequestBuilder;
@class MSGraphPostsCollectionRequestBuilder;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphConversationThreadRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphConversationThread *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphConversationThread *)conversationThread withCompletion:(void (^)(MSGraphConversationThread *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
