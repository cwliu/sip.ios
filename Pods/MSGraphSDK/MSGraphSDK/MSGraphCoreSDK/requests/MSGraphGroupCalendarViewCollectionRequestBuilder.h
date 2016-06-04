// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphGroupCalendarViewCollectionRequest, MSGraphEventRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphGroupCalendarViewCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupCalendarViewCollectionRequest *)request;

- (MSGraphGroupCalendarViewCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphEventRequestBuilder *)event:(NSString *)event;


@end
