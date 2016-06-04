// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphConversationThreadRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphConversationThreadCompletionHandler)(MSGraphConversationThread *response, NSError *error);

typedef void (^MSGraphConversationThreadsCollectionCompletionHandler)(MSCollection *response, MSGraphConversationThreadsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphConversationThreadsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphConversationThreadsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addConversationThread:(MSGraphConversationThread*)conversationThread withCompletion:(MSGraphConversationThreadCompletionHandler)completionHandler;

@end
