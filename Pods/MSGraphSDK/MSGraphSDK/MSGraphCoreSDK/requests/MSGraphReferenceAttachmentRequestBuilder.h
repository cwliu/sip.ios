// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphReferenceAttachmentRequest;


#import "MSGraphModels.h"
#import "MSGraphAttachmentRequestBuilder.h"


@interface MSGraphReferenceAttachmentRequestBuilder : MSGraphAttachmentRequestBuilder


- (MSGraphReferenceAttachmentRequest *) request;

- (MSGraphReferenceAttachmentRequest *) requestWithOptions:(NSArray *)options;


@end
