// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphEventRequest, MSGraphCalendarRequestBuilder, MSGraphEventRequestBuilder, MSGraphEventInstancesCollectionRequestBuilder, MSGraphAttachmentRequestBuilder, MSGraphEventAttachmentsCollectionRequestBuilder, MSGraphEventAcceptRequestBuilder, MSGraphEventDeclineRequestBuilder, MSGraphEventTentativelyAcceptRequestBuilder, MSGraphEventSnoozeReminderRequestBuilder, MSGraphEventDismissReminderRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphOutlookItemRequestBuilder.h"


@interface MSGraphEventRequestBuilder : MSGraphOutlookItemRequestBuilder

- (MSGraphCalendarRequestBuilder *) calendar;

- (MSGraphEventInstancesCollectionRequestBuilder *)instances;

- (MSGraphEventRequestBuilder *)instances:(NSString *)event;

- (MSGraphEventAttachmentsCollectionRequestBuilder *)attachments;

- (MSGraphAttachmentRequestBuilder *)attachments:(NSString *)attachment;

- (MSGraphEventAcceptRequestBuilder *)acceptWithComment:(NSString *)comment sendResponse:(BOOL)sendResponse ;



- (MSGraphEventDeclineRequestBuilder *)declineWithComment:(NSString *)comment sendResponse:(BOOL)sendResponse ;



- (MSGraphEventTentativelyAcceptRequestBuilder *)tentativelyAcceptWithComment:(NSString *)comment sendResponse:(BOOL)sendResponse ;



- (MSGraphEventSnoozeReminderRequestBuilder *)snoozeReminderWithNewReminderTime:(MSGraphDateTimeTimeZone *)newReminderTime ;



- (MSGraphEventDismissReminderRequestBuilder *)dismissReminder;




- (MSGraphEventRequest *) request;

- (MSGraphEventRequest *) requestWithOptions:(NSArray *)options;


@end
