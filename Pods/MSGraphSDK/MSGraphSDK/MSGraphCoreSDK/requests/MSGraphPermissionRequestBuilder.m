// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphPermissionRequestBuilder


- (MSGraphPermissionRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphPermissionRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphPermissionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
