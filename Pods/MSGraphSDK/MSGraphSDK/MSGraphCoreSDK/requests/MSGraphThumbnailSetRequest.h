// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphThumbnailSetRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphThumbnailSet *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphThumbnailSet *)thumbnailSet withCompletion:(void (^)(MSGraphThumbnailSet *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
