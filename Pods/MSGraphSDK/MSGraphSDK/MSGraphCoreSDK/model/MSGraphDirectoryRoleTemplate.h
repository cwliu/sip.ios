// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.




#import "MSGraphDirectoryObject.h"

@interface MSGraphDirectoryRoleTemplate : MSGraphDirectoryObject

  @property (nonatomic, setter=setDirectoryRoleTemplateDescription:, getter=directoryRoleTemplateDescription) NSString* directoryRoleTemplateDescription;
    @property (nonatomic, setter=setDisplayName:, getter=displayName) NSString* displayName;
  
@end
