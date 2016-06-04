// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
@class MSGraphCalendarRequestBuilder;
@class MSGraphCalendarsCollectionRequestBuilder;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphCalendarGroupRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphCalendarGroup *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphCalendarGroup *)calendarGroup withCompletion:(void (^)(MSGraphCalendarGroup *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
