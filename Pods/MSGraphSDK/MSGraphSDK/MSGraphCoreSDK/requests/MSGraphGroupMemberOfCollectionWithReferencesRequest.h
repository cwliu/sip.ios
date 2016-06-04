// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDirectoryObjectRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphDirectoryObjectCompletionHandler)(MSGraphDirectoryObject *response, NSError *error);

typedef void (^MSGraphGroupMemberOfCollectionWithReferencesCompletionHandler)(MSCollection *response, MSGraphGroupMemberOfCollectionWithReferencesRequest *nextRequest, NSError *error);

@interface MSGraphGroupMemberOfCollectionWithReferencesRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphGroupMemberOfCollectionWithReferencesCompletionHandler)completionHandler;
@end
