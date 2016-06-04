// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphMessageRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphMessageCompletionHandler)(MSGraphMessage *response, NSError *error);

typedef void (^MSGraphUserMessagesCollectionCompletionHandler)(MSCollection *response, MSGraphUserMessagesCollectionRequest *nextRequest, NSError *error);

@interface MSGraphUserMessagesCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphUserMessagesCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addMessage:(MSGraphMessage*)message withCompletion:(MSGraphMessageCompletionHandler)completionHandler;

@end
