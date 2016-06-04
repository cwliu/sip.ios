// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphDirectoryRoleTemplatesCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDirectoryRoleTemplatesCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDirectoryRoleTemplatesCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphDirectoryRoleTemplatesCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDirectoryRoleTemplateRequestBuilder *)directoryRoleTemplate:(NSString *)directoryRoleTemplate
{
    return [[MSGraphDirectoryRoleTemplateRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:directoryRoleTemplate]
                                                   client:self.client];
}

@end
