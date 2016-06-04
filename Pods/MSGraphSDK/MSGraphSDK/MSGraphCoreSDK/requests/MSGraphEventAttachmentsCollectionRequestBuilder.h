// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphEventAttachmentsCollectionRequest, MSGraphAttachmentRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphEventAttachmentsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphEventAttachmentsCollectionRequest *)request;

- (MSGraphEventAttachmentsCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphAttachmentRequestBuilder *)attachment:(NSString *)attachment;


@end
