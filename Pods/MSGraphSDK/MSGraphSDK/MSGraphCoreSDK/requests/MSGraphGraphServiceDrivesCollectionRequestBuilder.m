// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphDrivesCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphDrivesCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDrivesCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphDrivesCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphDriveRequestBuilder *)drive:(NSString *)drive
{
    return [[MSGraphDriveRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:drive]
                                                   client:self.client];
}

@end
