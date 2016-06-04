// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDirectoryRoleRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphDirectoryRoleCompletionHandler)(MSGraphDirectoryRole *response, NSError *error);

typedef void (^MSGraphDirectoryRolesCollectionCompletionHandler)(MSCollection *response, MSGraphDirectoryRolesCollectionRequest *nextRequest, NSError *error);

@interface MSGraphDirectoryRolesCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphDirectoryRolesCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addDirectoryRole:(MSGraphDirectoryRole*)directoryRole withCompletion:(MSGraphDirectoryRoleCompletionHandler)completionHandler;

@end
