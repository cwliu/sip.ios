// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphDirectoryRoleTemplateRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphDirectoryRoleTemplate *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphDirectoryRoleTemplate *)directoryRoleTemplate withCompletion:(void (^)(MSGraphDirectoryRoleTemplate *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
