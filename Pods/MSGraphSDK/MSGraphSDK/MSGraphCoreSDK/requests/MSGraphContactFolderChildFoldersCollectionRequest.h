// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphContactFolderRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphContactFolderCompletionHandler)(MSGraphContactFolder *response, NSError *error);

typedef void (^MSGraphContactFolderChildFoldersCollectionCompletionHandler)(MSCollection *response, MSGraphContactFolderChildFoldersCollectionRequest *nextRequest, NSError *error);

@interface MSGraphContactFolderChildFoldersCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphContactFolderChildFoldersCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addContactFolder:(MSGraphContactFolder*)contactFolder withCompletion:(MSGraphContactFolderCompletionHandler)completionHandler;

@end
