// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphContactFolderRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphContactFolderCompletionHandler)(MSGraphContactFolder *response, NSError *error);

typedef void (^MSGraphUserContactFoldersCollectionCompletionHandler)(MSCollection *response, MSGraphUserContactFoldersCollectionRequest *nextRequest, NSError *error);

@interface MSGraphUserContactFoldersCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphUserContactFoldersCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addContactFolder:(MSGraphContactFolder*)contactFolder withCompletion:(MSGraphContactFolderCompletionHandler)completionHandler;

@end
