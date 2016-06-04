// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphPostRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphPostCompletionHandler)(MSGraphPost *response, NSError *error);

typedef void (^MSGraphConversationThreadPostsCollectionCompletionHandler)(MSCollection *response, MSGraphConversationThreadPostsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphConversationThreadPostsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphConversationThreadPostsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addPost:(MSGraphPost*)post withCompletion:(MSGraphPostCompletionHandler)completionHandler;

@end
