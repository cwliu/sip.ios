// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSURLSessionDataTask;
@class MSGraphCalendarRequestBuilder;
@class MSGraphEventRequestBuilder;
@class MSGraphInstancesCollectionRequestBuilder;
@class MSGraphAttachmentRequestBuilder;
@class MSGraphAttachmentsCollectionRequestBuilder;
#import "MSGraphModels.h"
#import "MSRequest.h"

@interface MSGraphEventRequest : MSRequest

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphEvent *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)update:(MSGraphEvent *)event withCompletion:(void (^)(MSGraphEvent *response, NSError *error))completionHandler;

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler;

@end
