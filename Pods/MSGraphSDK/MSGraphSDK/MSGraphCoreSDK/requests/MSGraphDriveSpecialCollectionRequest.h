// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDriveItemRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphDriveItemCompletionHandler)(MSGraphDriveItem *response, NSError *error);

typedef void (^MSGraphDriveSpecialCollectionCompletionHandler)(MSCollection *response, MSGraphDriveSpecialCollectionRequest *nextRequest, NSError *error);

@interface MSGraphDriveSpecialCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphDriveSpecialCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addDriveItem:(MSGraphDriveItem*)driveItem withCompletion:(MSGraphDriveItemCompletionHandler)completionHandler;

@end
