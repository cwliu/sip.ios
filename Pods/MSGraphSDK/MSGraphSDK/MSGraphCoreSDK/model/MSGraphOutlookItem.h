// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.




#import "MSGraphEntity.h"

@interface MSGraphOutlookItem : MSGraphEntity

  @property (nonatomic, setter=setCreatedDateTime:, getter=createdDateTime) NSDate* createdDateTime;
    @property (nonatomic, setter=setLastModifiedDateTime:, getter=lastModifiedDateTime) NSDate* lastModifiedDateTime;
    @property (nonatomic, setter=setChangeKey:, getter=changeKey) NSString* changeKey;
    @property (nonatomic, setter=setCategories:, getter=categories) NSArray* categories;
  
@end
