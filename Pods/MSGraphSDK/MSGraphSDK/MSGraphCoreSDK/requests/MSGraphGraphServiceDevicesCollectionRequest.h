// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDeviceRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphDeviceCompletionHandler)(MSGraphDevice *response, NSError *error);

typedef void (^MSGraphDevicesCollectionCompletionHandler)(MSCollection *response, MSGraphDevicesCollectionRequest *nextRequest, NSError *error);

@interface MSGraphDevicesCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphDevicesCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addDevice:(MSGraphDevice*)device withCompletion:(MSGraphDeviceCompletionHandler)completionHandler;

@end
