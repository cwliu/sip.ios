// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphThumbnailSetRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphThumbnailSetCompletionHandler)(MSGraphThumbnailSet *response, NSError *error);

typedef void (^MSGraphDriveItemThumbnailsCollectionCompletionHandler)(MSCollection *response, MSGraphDriveItemThumbnailsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphDriveItemThumbnailsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphDriveItemThumbnailsCollectionCompletionHandler)completionHandler;
@end
