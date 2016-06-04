// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphMessageAttachmentsCollectionRequest, MSGraphAttachmentRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphMessageAttachmentsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphMessageAttachmentsCollectionRequest *)request;

- (MSGraphMessageAttachmentsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphAttachmentRequestBuilder *)attachment:(NSString *)attachment;


@end
