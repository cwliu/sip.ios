// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphCalendarGroupRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphCalendarGroupCompletionHandler)(MSGraphCalendarGroup *response, NSError *error);

typedef void (^MSGraphUserCalendarGroupsCollectionCompletionHandler)(MSCollection *response, MSGraphUserCalendarGroupsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphUserCalendarGroupsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphUserCalendarGroupsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addCalendarGroup:(MSGraphCalendarGroup*)calendarGroup withCompletion:(MSGraphCalendarGroupCompletionHandler)completionHandler;

@end
