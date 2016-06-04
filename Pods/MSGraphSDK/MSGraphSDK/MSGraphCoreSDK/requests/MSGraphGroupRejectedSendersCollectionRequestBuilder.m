// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphGroupRejectedSendersCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupRejectedSendersCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphGroupRejectedSendersCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphGroupRejectedSendersCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject
{
    return [[MSGraphDirectoryObjectRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:directoryObject]
                                                   client:self.client];
}

@end
