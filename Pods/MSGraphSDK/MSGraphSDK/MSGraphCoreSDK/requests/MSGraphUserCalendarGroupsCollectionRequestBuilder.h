// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserCalendarGroupsCollectionRequest, MSGraphCalendarGroupRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphUserCalendarGroupsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserCalendarGroupsCollectionRequest *)request;

- (MSGraphUserCalendarGroupsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphCalendarGroupRequestBuilder *)calendarGroup:(NSString *)calendarGroup;


@end
