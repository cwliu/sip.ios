// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"


@implementation MSGraphDriveRecentRequestBuilder

- (MSGraphDriveRecentRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDriveRecentRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphDriveRecentRequest alloc] initWithURL:self.requestURL client:self.client];
}

@end
