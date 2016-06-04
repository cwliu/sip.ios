// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphAttachmentRequestBuilder


- (MSGraphAttachmentRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphAttachmentRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphAttachmentRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
