// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSURLSessionDownloadTask, MSURLSessionUploadTask, MSGraphThumbnail;

typedef void(^MSGraphThumbnailUploadCompletionHandler)(MSGraphThumbnail *response, NSError* error);

#import "MSRequest.h"

@interface MSGraphThumbnailContentRequest : MSRequest

- (MSURLSessionDownloadTask *) downloadWithCompletion:(MSDownloadCompletionHandler)completionHandler;

- (MSURLSessionUploadTask *) uploadFromData:(NSData *)data
                                 completion:(MSGraphThumbnailUploadCompletionHandler)completionHandler;

- (MSURLSessionUploadTask *) uploadFromFile:(NSURL *)fileUrl
                                 completion:(MSGraphThumbnailUploadCompletionHandler)completionHandler;

@end
