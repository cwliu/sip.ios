// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphDirectoryRoleTemplateRequestBuilder


- (MSGraphDirectoryRoleTemplateRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDirectoryRoleTemplateRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphDirectoryRoleTemplateRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
