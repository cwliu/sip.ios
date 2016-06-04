// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
@class MSGraphMessageRequestBuilder;
@class MSGraphMessagesCollectionRequestBuilder;
@class MSGraphMailFolderRequestBuilder;
@class MSGraphChildFoldersCollectionRequestBuilder;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphMailFolderRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphMailFolder *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphMailFolder *)mailFolder withCompletion:(void (^)(MSGraphMailFolder *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
