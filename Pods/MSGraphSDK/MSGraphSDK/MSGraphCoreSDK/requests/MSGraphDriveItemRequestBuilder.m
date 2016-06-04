// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphDriveItemRequestBuilder

-(MSGraphUserRequestBuilder *)createdByUser
{
    return [[MSGraphUserRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"createdByUser"] client:self.client];

}

-(MSGraphUserRequestBuilder *)lastModifiedByUser
{
    return [[MSGraphUserRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"lastModifiedByUser"] client:self.client];

}

- (MSGraphDriveItemPermissionsCollectionRequestBuilder *)permissions
{
    return [[MSGraphDriveItemPermissionsCollectionRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"permissions"]  
                                                                             client:self.client];
}

- (MSGraphPermissionRequestBuilder *)permissions:(NSString *)permission
{
    return [[self permissions] permission:permission];
}

- (MSGraphDriveItemChildrenCollectionRequestBuilder *)children
{
    return [[MSGraphDriveItemChildrenCollectionRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"children"]  
                                                                          client:self.client];
}

- (MSGraphDriveItemRequestBuilder *)children:(NSString *)driveItem
{
    return [[self children] driveItem:driveItem];
}

- (MSGraphDriveItemThumbnailsCollectionRequestBuilder *)thumbnails
{
    return [[MSGraphDriveItemThumbnailsCollectionRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"thumbnails"]  
                                                                            client:self.client];
}

- (MSGraphThumbnailSetRequestBuilder *)thumbnails:(NSString *)thumbnailSet
{
    return [[self thumbnails] thumbnailSet:thumbnailSet];
}

- (MSGraphDriveItemContentRequest *) contentRequestWithOptions:(NSArray *)options
{
    NSURL *contentURL = [self.requestURL URLByAppendingPathComponent:@"content"];
    return [[MSGraphDriveItemContentRequest alloc] initWithURL:contentURL options:options client:self.client];
}

- (MSGraphDriveItemContentRequest *) contentRequest
{
    return [self contentRequestWithOptions:nil];
}

- (MSGraphDriveItemCreateLinkRequestBuilder *)createLinkWithType:(NSString *)type scope:(NSString *)scope 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.createLink"];
    return [[MSGraphDriveItemCreateLinkRequestBuilder alloc] initWithType:type
                                                                    scope:scope
                                                                      URL:actionURL
                                                                   client:self.client];


}

- (MSGraphDriveItemCopyRequestBuilder *)copyWithName:(NSString *)name parentReference:(MSGraphItemReference *)parentReference 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.copy"];
    return [[MSGraphDriveItemCopyRequestBuilder alloc] initWithName:name
                                                    parentReference:parentReference
                                                                URL:actionURL
                                                             client:self.client];


}

- (MSGraphDriveItemSearchRequestBuilder *)searchWithQ:(NSString *)q 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.search"];
    return [[MSGraphDriveItemSearchRequestBuilder alloc] initWithQ:q
                                                               URL:actionURL
                                                            client:self.client];


}

- (MSGraphDriveItemDeltaRequestBuilder *)delta
{
    return [[MSGraphDriveItemDeltaRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"microsoft.graph.delta"] client:self.client];
}


- (MSGraphDriveItemRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphDriveItemRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphDriveItemRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
