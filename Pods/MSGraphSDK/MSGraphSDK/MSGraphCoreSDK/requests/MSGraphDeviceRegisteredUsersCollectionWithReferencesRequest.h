// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDirectoryObjectRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphDirectoryObjectCompletionHandler)(MSGraphDirectoryObject *response, NSError *error);

typedef void (^MSGraphDeviceRegisteredUsersCollectionWithReferencesCompletionHandler)(MSCollection *response, MSGraphDeviceRegisteredUsersCollectionWithReferencesRequest *nextRequest, NSError *error);

@interface MSGraphDeviceRegisteredUsersCollectionWithReferencesRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphDeviceRegisteredUsersCollectionWithReferencesCompletionHandler)completionHandler;
@end
