

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDirectoryObjectRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphDirectoryObjectCompletionHandler)(MSGraphDirectoryObject *response, NSError *error);

typedef void (^MSGraphDeviceRegisteredOwnersCollectionReferencesCompletionHandler)(MSCollection *response, MSGraphDeviceRegisteredOwnersCollectionReferencesRequest *nextRequest, NSError *error);

@interface MSGraphDeviceRegisteredOwnersCollectionReferencesRequest : MSCollectionRequest


- (MSURLSessionDataTask *)addDirectoryObject:(MSGraphDirectoryObject*)directoryObject withCompletion:(MSGraphDirectoryObjectCompletionHandler)completionHandler;

@end
