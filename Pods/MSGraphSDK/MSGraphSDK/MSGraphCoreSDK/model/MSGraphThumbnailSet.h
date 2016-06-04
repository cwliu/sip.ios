// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphThumbnail; 


#import "MSGraphEntity.h"

@interface MSGraphThumbnailSet : MSGraphEntity

  @property (nonatomic, setter=setLarge:, getter=large) MSGraphThumbnail* large;
    @property (nonatomic, setter=setMedium:, getter=medium) MSGraphThumbnail* medium;
    @property (nonatomic, setter=setSmall:, getter=small) MSGraphThumbnail* small;
    @property (nonatomic, setter=setSource:, getter=source) MSGraphThumbnail* source;
  
@end
