// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphOrganizationRequestBuilder


- (MSGraphOrganizationRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphOrganizationRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphOrganizationRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
