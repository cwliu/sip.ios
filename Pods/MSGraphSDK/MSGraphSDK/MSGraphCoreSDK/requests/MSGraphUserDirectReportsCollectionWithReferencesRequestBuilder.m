// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphUserDirectReportsCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserDirectReportsCollectionWithReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserDirectReportsCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphUserDirectReportsCollectionWithReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject
{
    return [[MSGraphDirectoryObjectRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:directoryObject]
                                                   client:self.client];
}
- (MSGraphUserDirectReportsCollectionReferencesRequestBuilder *) references
{
    return [[MSGraphUserDirectReportsCollectionReferencesRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"$ref"] client:self.client];
}

@end
