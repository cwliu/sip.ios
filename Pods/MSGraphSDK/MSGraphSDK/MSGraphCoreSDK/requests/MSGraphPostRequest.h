// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
@class MSGraphPostRequestBuilder;
@class MSGraphAttachmentRequestBuilder;
@class MSGraphAttachmentsCollectionRequestBuilder;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphPostRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphPost *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphPost *)post withCompletion:(void (^)(MSGraphPost *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
