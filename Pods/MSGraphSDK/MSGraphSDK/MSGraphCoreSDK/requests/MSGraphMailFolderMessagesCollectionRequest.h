// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphMessageRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphMessageCompletionHandler)(MSGraphMessage *response, NSError *error);

typedef void (^MSGraphMailFolderMessagesCollectionCompletionHandler)(MSCollection *response, MSGraphMailFolderMessagesCollectionRequest *nextRequest, NSError *error);

@interface MSGraphMailFolderMessagesCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphMailFolderMessagesCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addMessage:(MSGraphMessage*)message withCompletion:(MSGraphMessageCompletionHandler)completionHandler;

@end
