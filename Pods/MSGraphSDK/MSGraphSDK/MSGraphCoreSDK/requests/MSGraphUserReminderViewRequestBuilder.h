// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphUserReminderViewRequest;

@interface MSGraphUserReminderViewRequestBuilder : MSRequestBuilder

- (instancetype)initWithStartDateTime:(NSString *)startDateTime endDateTime:(NSString *)endDateTime URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphUserReminderViewRequest *)request;

- (MSGraphUserReminderViewRequest *)requestWithOptions:(NSArray *)options;

@end
