// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphThumbnailSetRequestBuilder

-(MSGraphThumbnailRequestBuilder *)large
{
    return [[MSGraphThumbnailRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"large"] client:self.client];

}

-(MSGraphThumbnailRequestBuilder *)medium
{
    return [[MSGraphThumbnailRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"medium"] client:self.client];

}

-(MSGraphThumbnailRequestBuilder *)small
{
    return [[MSGraphThumbnailRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"small"] client:self.client];

}

-(MSGraphThumbnailRequestBuilder *)source
{
    return [[MSGraphThumbnailRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"source"] client:self.client];

}


- (MSGraphThumbnailSetRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphThumbnailSetRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphThumbnailSetRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
