// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphDeviceRegisteredOwnersCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDeviceRegisteredOwnersCollectionWithReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDeviceRegisteredOwnersCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphDeviceRegisteredOwnersCollectionWithReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject
{
    return [[MSGraphDirectoryObjectRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:directoryObject]
                                                   client:self.client];
}
- (MSGraphDeviceRegisteredOwnersCollectionReferencesRequestBuilder *) references
{
    return [[MSGraphDeviceRegisteredOwnersCollectionReferencesRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"$ref"] client:self.client];
}

@end
