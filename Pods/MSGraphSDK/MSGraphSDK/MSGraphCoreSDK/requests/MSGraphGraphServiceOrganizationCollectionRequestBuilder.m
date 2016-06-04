// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphOrganizationCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphOrganizationCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphOrganizationCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphOrganizationCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphOrganizationRequestBuilder *)organization:(NSString *)organization
{
    return [[MSGraphOrganizationRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:organization]
                                                   client:self.client];
}

@end
