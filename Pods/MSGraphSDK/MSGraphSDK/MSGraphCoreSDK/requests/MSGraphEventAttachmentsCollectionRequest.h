// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphAttachmentRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphAttachmentCompletionHandler)(MSGraphAttachment *response, NSError *error);

typedef void (^MSGraphEventAttachmentsCollectionCompletionHandler)(MSCollection *response, MSGraphEventAttachmentsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphEventAttachmentsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphEventAttachmentsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addAttachment:(MSGraphAttachment*)attachment withCompletion:(MSGraphAttachmentCompletionHandler)completionHandler;

@end
