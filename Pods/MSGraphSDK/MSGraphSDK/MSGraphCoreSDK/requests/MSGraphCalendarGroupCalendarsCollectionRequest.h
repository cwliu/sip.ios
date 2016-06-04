// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphCalendarRequest, MSURLSessionDataTask;

#import "MSGraphModels.h"
#import "MSCollectionRequest.h"

typedef void (^MSGraphCalendarCompletionHandler)(MSGraphCalendar *response, NSError *error);

typedef void (^MSGraphCalendarGroupCalendarsCollectionCompletionHandler)(MSCollection *response, MSGraphCalendarGroupCalendarsCollectionRequest *nextRequest, NSError *error);

@interface MSGraphCalendarGroupCalendarsCollectionRequest : MSCollectionRequest

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphCalendarGroupCalendarsCollectionCompletionHandler)completionHandler;

- (MSURLSessionDataTask *)addCalendar:(MSGraphCalendar*)calendar withCompletion:(MSGraphCalendarCompletionHandler)completionHandler;

@end
