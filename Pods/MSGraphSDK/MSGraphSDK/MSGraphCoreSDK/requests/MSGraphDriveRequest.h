// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
@class MSGraphDriveItemRequestBuilder;
@class MSGraphItemsCollectionRequestBuilder;
@class MSGraphSpecialCollectionRequestBuilder;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphDriveRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphDrive *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphDrive *)drive withCompletion:(void (^)(MSGraphDrive *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
