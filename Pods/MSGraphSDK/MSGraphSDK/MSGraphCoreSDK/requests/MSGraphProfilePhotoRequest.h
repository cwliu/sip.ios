// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphProfilePhotoRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphProfilePhoto *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphProfilePhoto *)profilePhoto withCompletion:(void (^)(MSGraphProfilePhoto *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
