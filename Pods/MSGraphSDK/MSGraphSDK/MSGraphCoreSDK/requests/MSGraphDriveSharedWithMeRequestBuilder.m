// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"


@implementation MSGraphDriveSharedWithMeRequestBuilder

- (MSGraphDriveSharedWithMeRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDriveSharedWithMeRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphDriveSharedWithMeRequest alloc] initWithURL:self.requestURL client:self.client];
}

@end
