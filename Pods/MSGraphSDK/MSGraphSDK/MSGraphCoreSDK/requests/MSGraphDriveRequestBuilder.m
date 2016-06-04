// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphDriveRequestBuilder

- (MSGraphDriveItemsCollectionRequestBuilder *)items
{
    return [[MSGraphDriveItemsCollectionRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"items"]  
                                                                   client:self.client];
}

- (MSGraphDriveItemRequestBuilder *)items:(NSString *)driveItem
{
    return [[self items] driveItem:driveItem];
}

- (MSGraphDriveSpecialCollectionRequestBuilder *)special
{
    return [[MSGraphDriveSpecialCollectionRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"special"]  
                                                                     client:self.client];
}

- (MSGraphDriveItemRequestBuilder *)special:(NSString *)driveItem
{
    return [[self special] driveItem:driveItem];
}

-(MSGraphDriveItemRequestBuilder *)root
{
    return [[MSGraphDriveItemRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"root"] client:self.client];

}

- (MSGraphDriveRecentRequestBuilder *)recent
{
    return [[MSGraphDriveRecentRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"microsoft.graph.recent"] client:self.client];
}

- (MSGraphDriveSharedWithMeRequestBuilder *)sharedWithMe
{
    return [[MSGraphDriveSharedWithMeRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"microsoft.graph.sharedWithMe"] client:self.client];
}


- (MSGraphDriveRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDriveRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphDriveRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
