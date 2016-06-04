// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphCalendarGroupRequest, MSGraphCalendarRequestBuilder, MSGraphCalendarGroupCalendarsCollectionRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphEntityRequestBuilder.h"


@interface MSGraphCalendarGroupRequestBuilder : MSGraphEntityRequestBuilder

- (MSGraphCalendarGroupCalendarsCollectionRequestBuilder *)calendars;

- (MSGraphCalendarRequestBuilder *)calendars:(NSString *)calendar;


- (MSGraphCalendarGroupRequest *) request;

- (MSGraphCalendarGroupRequest *) requestWithOptions:(NSArray *)options;


@end
