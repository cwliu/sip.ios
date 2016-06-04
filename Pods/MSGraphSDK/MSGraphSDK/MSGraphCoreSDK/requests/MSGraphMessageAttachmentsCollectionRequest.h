// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphAttachmentRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphAttachmentCompletionHandler)(MSGraphAttachment *response, NSError *error);

typedef void (^MSGraphMessageAttachmentsCollectionCompletionHandler)(MSCollection *response, MSGraphMessageAttachmentsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphMessageAttachmentsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphMessageAttachmentsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addAttachment:(MSGraphAttachment*)attachment withCompletion:(MSGraphAttachmentCompletionHandler)completionHandler;

@end
