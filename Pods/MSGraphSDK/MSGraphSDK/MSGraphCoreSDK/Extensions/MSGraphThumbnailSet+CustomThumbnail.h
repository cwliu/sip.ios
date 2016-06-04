// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSGraphThumbnailSet.h"
#import "MSGraphThumbnailSetRequestBuilder.h"

@interface MSGraphThumbnailSet (CustomThumbnail)

- (MSGraphThumbnail *)customThumbnailWithSize:(NSString *)size;

@end

@interface MSGraphThumbnailSetRequestBuilder (CustomThumbnail)

- (MSGraphThumbnailRequestBuilder *)customThumbnailWithSize:(NSString *)size;

@end
