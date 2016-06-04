// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
@class MSGraphDirectoryObjectRequestBuilder;
@class MSGraphMembersCollectionRequestBuilder;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphDirectoryRoleRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphDirectoryRole *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphDirectoryRole *)directoryRole withCompletion:(void (^)(MSGraphDirectoryRole *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
