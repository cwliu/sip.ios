// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphIdentitySet, MSGraphQuota, MSGraphDriveItem; 


#import "MSGraphEntity.h"

@interface MSGraphDrive : MSGraphEntity

  @property (nonatomic, setter=setDriveType:, getter=driveType) NSString* driveType;
    @property (nonatomic, setter=setOwner:, getter=owner) MSGraphIdentitySet* owner;
    @property (nonatomic, setter=setQuota:, getter=quota) MSGraphQuota* quota;
    @property (nonatomic, setter=setItems:, getter=items) NSArray* items;
    @property (nonatomic, setter=setSpecial:, getter=special) NSArray* special;
    @property (nonatomic, setter=setRoot:, getter=root) MSGraphDriveItem* root;
  
@end
