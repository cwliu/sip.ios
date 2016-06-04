// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDriveItemRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphDriveItemCompletionHandler)(MSGraphDriveItem *response, NSError *error);

typedef void (^MSGraphDriveItemsCollectionCompletionHandler)(MSCollection *response, MSGraphDriveItemsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphDriveItemsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphDriveItemsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addDriveItem:(MSGraphDriveItem*)driveItem withCompletion:(MSGraphDriveItemCompletionHandler)completionHandler;

@end
