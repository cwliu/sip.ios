// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDirectoryObjectRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphDirectoryObjectCompletionHandler)(MSGraphDirectoryObject *response, NSError *error);

typedef void (^MSGraphUserOwnedObjectsCollectionWithReferencesCompletionHandler)(MSCollection *response, MSGraphUserOwnedObjectsCollectionWithReferencesRequest *nextRequest, NSError *error);

@interface MSGraphUserOwnedObjectsCollectionWithReferencesRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphUserOwnedObjectsCollectionWithReferencesCompletionHandler)completionHandler;
@end
