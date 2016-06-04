// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphEventRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphEventCompletionHandler)(MSGraphEvent *response, NSError *error);

typedef void (^MSGraphCalendarCalendarViewCollectionCompletionHandler)(MSCollection *response, MSGraphCalendarCalendarViewCollectionRequest *nextRequest, NSError *error);

@interface MSGraphCalendarCalendarViewCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphCalendarCalendarViewCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addEvent:(MSGraphEvent*)event withCompletion:(MSGraphEventCompletionHandler)completionHandler;

@end
