// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphPostAttachmentsCollectionRequest, MSGraphAttachmentRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphPostAttachmentsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphPostAttachmentsCollectionRequest *)request;

- (MSGraphPostAttachmentsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphAttachmentRequestBuilder *)attachment:(NSString *)attachment;


@end
