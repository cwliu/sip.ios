// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDirectoryObjectRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphDirectoryObjectCompletionHandler)(MSGraphDirectoryObject *response, NSError *error);

typedef void (^MSGraphUserRegisteredDevicesCollectionWithReferencesCompletionHandler)(MSCollection *response, MSGraphUserRegisteredDevicesCollectionWithReferencesRequest *nextRequest, NSError *error);

@interface MSGraphUserRegisteredDevicesCollectionWithReferencesRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphUserRegisteredDevicesCollectionWithReferencesCompletionHandler)completionHandler;
@end
