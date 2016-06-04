// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphDirectoryObject; 


#import "MSGraphDirectoryObject.h"

@interface MSGraphDirectoryRole : MSGraphDirectoryObject

  @property (nonatomic, setter=setDirectoryRoleDescription:, getter=directoryRoleDescription) NSString* directoryRoleDescription;
    @property (nonatomic, setter=setDisplayName:, getter=displayName) NSString* displayName;
    @property (nonatomic, setter=setRoleTemplateId:, getter=roleTemplateId) NSString* roleTemplateId;
    @property (nonatomic, setter=setMembers:, getter=members) NSArray* members;
  
@end
