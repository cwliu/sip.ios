// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphContactRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphContactCompletionHandler)(MSGraphContact *response, NSError *error);

typedef void (^MSGraphUserContactsCollectionCompletionHandler)(MSCollection *response, MSGraphUserContactsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphUserContactsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphUserContactsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addContact:(MSGraphContact*)contact withCompletion:(MSGraphContactCompletionHandler)completionHandler;

@end
