// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.




#import "MSGraphEntity.h"

@interface MSGraphAttachment : MSGraphEntity

  @property (nonatomic, setter=setLastModifiedDateTime:, getter=lastModifiedDateTime) NSDate* lastModifiedDateTime;
    @property (nonatomic, setter=setName:, getter=name) NSString* name;
    @property (nonatomic, setter=setContentType:, getter=contentType) NSString* contentType;
    @property (nonatomic, setter=setSize:, getter=size) int32_t size;
    @property (nonatomic, setter=setIsInline:, getter=isInline) BOOL isInline;
  
@end
