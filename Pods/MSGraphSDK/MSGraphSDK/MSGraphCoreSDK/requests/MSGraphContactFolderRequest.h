// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
@class MSGraphContactRequestBuilder;
@class MSGraphContactsCollectionRequestBuilder;
@class MSGraphContactFolderRequestBuilder;
@class MSGraphChildFoldersCollectionRequestBuilder;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphContactFolderRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphContactFolder *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphContactFolder *)contactFolder withCompletion:(void (^)(MSGraphContactFolder *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
