// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"


@implementation MSGraphDriveItemDeltaRequestBuilder

- (MSGraphDriveItemDeltaRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDriveItemDeltaRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphDriveItemDeltaRequest alloc] initWithURL:self.requestURL client:self.client];
}

@end
