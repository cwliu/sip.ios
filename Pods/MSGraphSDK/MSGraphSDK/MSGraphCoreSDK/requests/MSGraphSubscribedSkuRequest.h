// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphSubscribedSkuRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphSubscribedSku *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphSubscribedSku *)subscribedSku withCompletion:(void (^)(MSGraphSubscribedSku *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
