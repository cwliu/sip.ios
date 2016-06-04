// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphThumbnailRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphThumbnail *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphThumbnail *)thumbnail withCompletion:(void (^)(MSGraphThumbnail *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
