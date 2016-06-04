// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.




#import "MSGraphAttachment.h"

@interface MSGraphFileAttachment : MSGraphAttachment

  @property (nonatomic, setter=setContentId:, getter=contentId) NSString* contentId;
    @property (nonatomic, setter=setContentLocation:, getter=contentLocation) NSString* contentLocation;
    @property (nonatomic, setter=setContentBytes:, getter=contentBytes) NSString* contentBytes;
  
@end
