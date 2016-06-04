// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
@class MSGraphEventRequestBuilder;
@class MSGraphEventsCollectionRequestBuilder;
@class MSGraphCalendarViewCollectionRequestBuilder;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphCalendarRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphCalendar *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphCalendar *)calendar withCompletion:(void (^)(MSGraphCalendar *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
