// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphReferenceAttachmentRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphReferenceAttachment *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphReferenceAttachment *)referenceAttachment withCompletion:(void (^)(MSGraphReferenceAttachment *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
