// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphCalendarCalendarViewCollectionRequest, MSGraphEventRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphCalendarCalendarViewCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphCalendarCalendarViewCollectionRequest *)request;

- (MSGraphCalendarCalendarViewCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphEventRequestBuilder *)event:(NSString *)event;


@end
