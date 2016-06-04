// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphReferenceAttachmentRequestBuilder


- (MSGraphReferenceAttachmentRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphReferenceAttachmentRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphReferenceAttachmentRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
