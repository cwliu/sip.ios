// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphThumbnailRequestBuilder

- (MSGraphThumbnailContentRequest *) contentRequestWithOptions:(NSArray *)options
{
    NSURL *contentURL = [self.requestURL URLByAppendingPathComponent:@"content"];
    return [[MSGraphThumbnailContentRequest alloc] initWithURL:contentURL options:options client:self.client];
}

- (MSGraphThumbnailContentRequest *) contentRequest
{
    return [self contentRequestWithOptions:nil];
}


- (MSGraphThumbnailRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphThumbnailRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphThumbnailRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
