// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphConversationRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphConversationCompletionHandler)(MSGraphConversation *response, NSError *error);

typedef void (^MSGraphGroupConversationsCollectionCompletionHandler)(MSCollection *response, MSGraphGroupConversationsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphGroupConversationsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphGroupConversationsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addConversation:(MSGraphConversation*)conversation withCompletion:(MSGraphConversationCompletionHandler)completionHandler;

@end
