// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSURLSessionDownloadTask, MSURLSessionUploadTask, MSGraphProfilePhoto;

typedef void(^MSGraphProfilePhotoUploadCompletionHandler)(MSGraphProfilePhoto *response, NSError* error);

#import "MSRequest.h"

@interface MSGraphProfilePhotoStreamRequest : MSRequest

- (MSURLSessionDownloadTask *) downloadWithCompletion:(MSDownloadCompletionHandler)completionHandler;

- (MSURLSessionUploadTask *) uploadFromData:(NSData *)data
                                 completion:(MSGraphProfilePhotoUploadCompletionHandler)completionHandler;

- (MSURLSessionUploadTask *) uploadFromFile:(NSURL *)fileUrl
                                 completion:(MSGraphProfilePhotoUploadCompletionHandler)completionHandler;

@end
