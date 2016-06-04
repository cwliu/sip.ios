// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
@class MSGraphDirectoryObjectRequestBuilder;
@class MSGraphMembersCollectionRequestBuilder;
@class MSGraphMemberOfCollectionRequestBuilder;
@class MSGraphOwnersCollectionRequestBuilder;
@class MSGraphConversationThreadRequestBuilder;
@class MSGraphThreadsCollectionRequestBuilder;
@class MSGraphCalendarRequestBuilder;
@class MSGraphEventRequestBuilder;
@class MSGraphCalendarViewCollectionRequestBuilder;
@class MSGraphEventsCollectionRequestBuilder;
@class MSGraphConversationRequestBuilder;
@class MSGraphConversationsCollectionRequestBuilder;
@class MSGraphProfilePhotoRequestBuilder;
@class MSGraphAcceptedSendersCollectionRequestBuilder;
@class MSGraphRejectedSendersCollectionRequestBuilder;
@class MSGraphDriveRequestBuilder;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphGroupRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphGroup *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphGroup *)group withCompletion:(void (^)(MSGraphGroup *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
