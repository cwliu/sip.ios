// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphAttachmentRequest;


#import "MSGraphModels.h"
#import "MSGraphEntityRequestBuilder.h"


@interface MSGraphAttachmentRequestBuilder : MSGraphEntityRequestBuilder


- (MSGraphAttachmentRequest *) request;

- (MSGraphAttachmentRequest *) requestWithOptions:(NSArray *)options;


@end
