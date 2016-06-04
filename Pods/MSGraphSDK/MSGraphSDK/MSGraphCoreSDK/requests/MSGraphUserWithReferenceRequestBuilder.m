

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphUserWithReferenceRequestBuilder


- (MSGraphUserWithReferenceRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserWithReferenceRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphUserWithReferenceRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}

- (MSGraphUserReferenceRequestBuilder *) reference
{
    return [[MSGraphUserReferenceRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"$ref"] client:self.client];
}

@end
