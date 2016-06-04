// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
@class MSGraphEventRequestBuilder;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphEventMessageRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphEventMessage *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphEventMessage *)eventMessage withCompletion:(void (^)(MSGraphEventMessage *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
