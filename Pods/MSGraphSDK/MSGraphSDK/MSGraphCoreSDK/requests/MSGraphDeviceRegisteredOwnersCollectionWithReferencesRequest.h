// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDirectoryObjectRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphDirectoryObjectCompletionHandler)(MSGraphDirectoryObject *response, NSError *error);

typedef void (^MSGraphDeviceRegisteredOwnersCollectionWithReferencesCompletionHandler)(MSCollection *response, MSGraphDeviceRegisteredOwnersCollectionWithReferencesRequest *nextRequest, NSError *error);

@interface MSGraphDeviceRegisteredOwnersCollectionWithReferencesRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphDeviceRegisteredOwnersCollectionWithReferencesCompletionHandler)completionHandler;
@end
