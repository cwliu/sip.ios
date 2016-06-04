// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphGroupRequest, MSGraphDirectoryObjectRequestBuilder, MSGraphGroupMembersCollectionWithReferencesRequestBuilder, MSGraphGroupMemberOfCollectionWithReferencesRequestBuilder, MSGraphCreatedOnBehalfOfRequestBuilder, MSGraphGroupOwnersCollectionWithReferencesRequestBuilder, MSGraphConversationThreadRequestBuilder, MSGraphGroupThreadsCollectionRequestBuilder, MSGraphCalendarRequestBuilder, MSGraphEventRequestBuilder, MSGraphGroupCalendarViewCollectionRequestBuilder, MSGraphGroupEventsCollectionRequestBuilder, MSGraphConversationRequestBuilder, MSGraphGroupConversationsCollectionRequestBuilder, MSGraphProfilePhotoRequestBuilder, MSGraphPhotoRequestBuilder, MSGraphGroupAcceptedSendersCollectionRequestBuilder, MSGraphGroupRejectedSendersCollectionRequestBuilder, MSGraphDriveRequestBuilder, MSGraphProfilePhotoStreamRequest, MSGraphGroupSubscribeByMailRequestBuilder, MSGraphGroupUnsubscribeByMailRequestBuilder, MSGraphGroupAddFavoriteRequestBuilder, MSGraphGroupRemoveFavoriteRequestBuilder, MSGraphGroupResetUnseenCountRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphDirectoryObjectRequestBuilder.h"


@interface MSGraphGroupRequestBuilder : MSGraphDirectoryObjectRequestBuilder

- (MSGraphGroupMembersCollectionWithReferencesRequestBuilder *)members;

- (MSGraphDirectoryObjectRequestBuilder *)members:(NSString *)directoryObject;

- (MSGraphGroupMemberOfCollectionWithReferencesRequestBuilder *)memberOf;

- (MSGraphDirectoryObjectRequestBuilder *)memberOf:(NSString *)directoryObject;

- (MSGraphDirectoryObjectRequestBuilder *) createdOnBehalfOf;

- (MSGraphGroupOwnersCollectionWithReferencesRequestBuilder *)owners;

- (MSGraphDirectoryObjectRequestBuilder *)owners:(NSString *)directoryObject;

- (MSGraphGroupThreadsCollectionRequestBuilder *)threads;

- (MSGraphConversationThreadRequestBuilder *)threads:(NSString *)conversationThread;

- (MSGraphCalendarRequestBuilder *) calendar;

- (MSGraphGroupCalendarViewCollectionRequestBuilder *)calendarView;

- (MSGraphEventRequestBuilder *)calendarView:(NSString *)event;

- (MSGraphGroupEventsCollectionRequestBuilder *)events;

- (MSGraphEventRequestBuilder *)events:(NSString *)event;

- (MSGraphGroupConversationsCollectionRequestBuilder *)conversations;

- (MSGraphConversationRequestBuilder *)conversations:(NSString *)conversation;

- (MSGraphProfilePhotoRequestBuilder *) photo;

- (MSGraphGroupAcceptedSendersCollectionRequestBuilder *)acceptedSenders;

- (MSGraphDirectoryObjectRequestBuilder *)acceptedSenders:(NSString *)directoryObject;

- (MSGraphGroupRejectedSendersCollectionRequestBuilder *)rejectedSenders;

- (MSGraphDirectoryObjectRequestBuilder *)rejectedSenders:(NSString *)directoryObject;

- (MSGraphDriveRequestBuilder *) drive;

- (MSGraphProfilePhotoStreamRequest *) photoValueWithOptions:(NSArray *)options;

- (MSGraphProfilePhotoStreamRequest *) photoValue;

- (MSGraphGroupSubscribeByMailRequestBuilder *)subscribeByMail;



- (MSGraphGroupUnsubscribeByMailRequestBuilder *)unsubscribeByMail;



- (MSGraphGroupAddFavoriteRequestBuilder *)addFavorite;



- (MSGraphGroupRemoveFavoriteRequestBuilder *)removeFavorite;



- (MSGraphGroupResetUnseenCountRequestBuilder *)resetUnseenCount;




- (MSGraphGroupRequest *) request;

- (MSGraphGroupRequest *) requestWithOptions:(NSArray *)options;


@end
