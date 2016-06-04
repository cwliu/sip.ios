// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphGroupRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphGroupCompletionHandler)(MSGraphGroup *response, NSError *error);

typedef void (^MSGraphGroupsCollectionCompletionHandler)(MSCollection *response, MSGraphGroupsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphGroupsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphGroupsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addGroup:(MSGraphGroup*)group withCompletion:(MSGraphGroupCompletionHandler)completionHandler;

@end
