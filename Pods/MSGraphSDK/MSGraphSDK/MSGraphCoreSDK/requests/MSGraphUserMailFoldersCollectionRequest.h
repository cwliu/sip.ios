// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphMailFolderRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphMailFolderCompletionHandler)(MSGraphMailFolder *response, NSError *error);

typedef void (^MSGraphUserMailFoldersCollectionCompletionHandler)(MSCollection *response, MSGraphUserMailFoldersCollectionRequest *nextRequest, NSError *error);

@interface MSGraphUserMailFoldersCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphUserMailFoldersCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addMailFolder:(MSGraphMailFolder*)mailFolder withCompletion:(MSGraphMailFolderCompletionHandler)completionHandler;

@end
