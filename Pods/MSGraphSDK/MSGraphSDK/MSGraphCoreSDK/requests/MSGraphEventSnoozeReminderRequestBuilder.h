// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphEventSnoozeReminderRequest;

@interface MSGraphEventSnoozeReminderRequestBuilder : MSRequestBuilder

- (instancetype)initWithNewReminderTime:(MSGraphDateTimeTimeZone *)newReminderTime URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphEventSnoozeReminderRequest *)request;

- (MSGraphEventSnoozeReminderRequest *)requestWithOptions:(NSArray *)options;

@end
