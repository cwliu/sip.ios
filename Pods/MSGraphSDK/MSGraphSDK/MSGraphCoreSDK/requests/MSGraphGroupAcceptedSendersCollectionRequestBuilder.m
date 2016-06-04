// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphGroupAcceptedSendersCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphGroupAcceptedSendersCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphGroupAcceptedSendersCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphGroupAcceptedSendersCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject
{
    return [[MSGraphDirectoryObjectRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:directoryObject]
                                                   client:self.client];
}

@end
