// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphContactRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphContactCompletionHandler)(MSGraphContact *response, NSError *error);

typedef void (^MSGraphContactFolderContactsCollectionCompletionHandler)(MSCollection *response, MSGraphContactFolderContactsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphContactFolderContactsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphContactFolderContactsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addContact:(MSGraphContact*)contact withCompletion:(MSGraphContactCompletionHandler)completionHandler;

@end
