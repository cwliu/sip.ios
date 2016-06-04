// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSGraphThumbnailSet+CustomThumbnail.h"
#import "MSGraphModels.h"
#import "MSGraphThumbnailRequestBuilder.h"

@implementation MSGraphThumbnailSet (CustomThumbnail)

- (MSGraphThumbnail *)customThumbnailWithSize:(NSString *)size
{
    NSDictionary *customThumbnail = [self dictionaryFromItem][size];
    return [[MSGraphThumbnail alloc] initWithDictionary:customThumbnail];
}

@end

@implementation MSGraphThumbnailSetRequestBuilder (CustomThumbnail)

- (MSGraphThumbnailRequestBuilder *)customThumbnailWithSize:(NSString *)size
{
    return [[MSGraphThumbnailRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:size] client:self.client];
}

@end
