// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphFileAttachmentRequest;


#import "MSGraphModels.h"
#import "MSGraphAttachmentRequestBuilder.h"


@interface MSGraphFileAttachmentRequestBuilder : MSGraphAttachmentRequestBuilder


- (MSGraphFileAttachmentRequest *) request;

- (MSGraphFileAttachmentRequest *) requestWithOptions:(NSArray *)options;


@end
