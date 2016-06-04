// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphItemAttachmentRequest, MSGraphOutlookItemRequestBuilder, MSGraphItemRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphAttachmentRequestBuilder.h"


@interface MSGraphItemAttachmentRequestBuilder : MSGraphAttachmentRequestBuilder

- (MSGraphOutlookItemRequestBuilder *) item;


- (MSGraphItemAttachmentRequest *) request;

- (MSGraphItemAttachmentRequest *) requestWithOptions:(NSArray *)options;


@end
