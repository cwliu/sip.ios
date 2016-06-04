// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphFileAttachmentRequestBuilder


- (MSGraphFileAttachmentRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphFileAttachmentRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphFileAttachmentRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
