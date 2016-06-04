// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
@class MSGraphOutlookItemRequestBuilder;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphItemAttachmentRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphItemAttachment *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphItemAttachment *)itemAttachment withCompletion:(void (^)(MSGraphItemAttachment *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
