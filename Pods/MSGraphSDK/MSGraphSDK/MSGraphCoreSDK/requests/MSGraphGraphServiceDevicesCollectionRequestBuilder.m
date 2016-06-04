// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphDevicesCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDevicesCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDevicesCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphDevicesCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDeviceRequestBuilder *)device:(NSString *)device
{
    return [[MSGraphDeviceRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:device]
                                                   client:self.client];
}

@end
