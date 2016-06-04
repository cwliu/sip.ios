// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphProfilePhotoRequestBuilder


- (MSGraphProfilePhotoRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphProfilePhotoRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphProfilePhotoRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
