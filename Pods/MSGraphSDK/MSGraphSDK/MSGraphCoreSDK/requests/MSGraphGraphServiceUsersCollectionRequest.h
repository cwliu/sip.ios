// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphUserRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphUserCompletionHandler)(MSGraphUser *response, NSError *error);

typedef void (^MSGraphUsersCollectionCompletionHandler)(MSCollection *response, MSGraphUsersCollectionRequest *nextRequest, NSError *error);

@interface MSGraphUsersCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphUsersCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addUser:(MSGraphUser*)user withCompletion:(MSGraphUserCompletionHandler)completionHandler;

@end
