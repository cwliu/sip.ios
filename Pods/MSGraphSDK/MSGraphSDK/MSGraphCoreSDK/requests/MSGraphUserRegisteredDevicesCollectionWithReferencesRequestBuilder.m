// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphUserRegisteredDevicesCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserRegisteredDevicesCollectionWithReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserRegisteredDevicesCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphUserRegisteredDevicesCollectionWithReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject
{
    return [[MSGraphDirectoryObjectRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:directoryObject]
                                                   client:self.client];
}
- (MSGraphUserRegisteredDevicesCollectionReferencesRequestBuilder *) references
{
    return [[MSGraphUserRegisteredDevicesCollectionReferencesRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"$ref"] client:self.client];
}

@end
