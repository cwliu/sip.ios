// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphDeviceRegisteredUsersCollectionWithReferencesRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDeviceRegisteredUsersCollectionWithReferencesRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDeviceRegisteredUsersCollectionWithReferencesRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphDeviceRegisteredUsersCollectionWithReferencesRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDirectoryObjectRequestBuilder *)directoryObject:(NSString *)directoryObject
{
    return [[MSGraphDirectoryObjectRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:directoryObject]
                                                   client:self.client];
}
- (MSGraphDeviceRegisteredUsersCollectionReferencesRequestBuilder *) references
{
    return [[MSGraphDeviceRegisteredUsersCollectionReferencesRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"$ref"] client:self.client];
}

@end
