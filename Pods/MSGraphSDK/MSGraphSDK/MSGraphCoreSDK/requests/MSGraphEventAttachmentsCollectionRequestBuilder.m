// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphEventAttachmentsCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphEventAttachmentsCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphEventAttachmentsCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphEventAttachmentsCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphAttachmentRequestBuilder *)attachment:(NSString *)attachment
{
    return [[MSGraphAttachmentRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:attachment]
                                                   client:self.client];
}

@end
