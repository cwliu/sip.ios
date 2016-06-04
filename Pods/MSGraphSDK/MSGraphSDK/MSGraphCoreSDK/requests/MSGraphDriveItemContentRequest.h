// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSURLSessionDownloadTask, MSURLSessionUploadTask, MSGraphDriveItem;

typedef void(^MSGraphDriveItemUploadCompletionHandler)(MSGraphDriveItem *response, NSError* error);

#import "MSRequest.h"

@interface MSGraphDriveItemContentRequest : MSRequest

- (MSURLSessionDownloadTask *) downloadWithCompletion:(MSDownloadCompletionHandler)completionHandler;

- (MSURLSessionUploadTask *) uploadFromData:(NSData *)data
                                 completion:(MSGraphDriveItemUploadCompletionHandler)completionHandler;

- (MSURLSessionUploadTask *) uploadFromFile:(NSURL *)fileUrl
                                 completion:(MSGraphDriveItemUploadCompletionHandler)completionHandler;

@end
