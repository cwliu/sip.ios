/*******************************************************************************
**NOTE** This code was generated by a tool and will occasionally be
overwritten. We welcome comments and issues regarding this code; they will be
addressed in the generation tool. If you wish to submit pull requests, please
do so for the templates in that tool.

This code was generated by Vipr (https://github.com/microsoft/vipr) using
the T4TemplateWriter (https://github.com/msopentech/vipr-t4templatewriter).

Copyright (c) Microsoft Open Technologies, Inc. All Rights Reserved.
Licensed under the Apache License 2.0; see LICENSE in the source repository
root for authoritative license information.﻿
******************************************************************************/

#import <Foundation/Foundation.h>
#import "MSOrcBaseEntity.h"

/**
* The header for type OAuth2PermissionGrant.
*/

@interface MSDirectoryOAuth2PermissionGrant : MSOrcBaseEntity

@property (copy, nonatomic, readwrite, getter=clientId, setter=setClientId:) NSString *clientId;
@property (copy, nonatomic, readwrite, getter=consentType, setter=setConsentType:) NSString *consentType;
@property (copy, nonatomic, readwrite, getter=expiryTime, setter=setExpiryTime:) NSDate *expiryTime;
@property (copy, nonatomic, readwrite, getter=objectId, setter=setObjectId:) NSString *objectId;
@property (copy, nonatomic, readwrite, getter=principalId, setter=setPrincipalId:) NSString *principalId;
@property (copy, nonatomic, readwrite, getter=resourceId, setter=setResourceId:) NSString *resourceId;
@property (copy, nonatomic, readwrite, getter=scope, setter=setScope:) NSString *scope;
@property (copy, nonatomic, readwrite, getter=startTime, setter=setStartTime:) NSDate *startTime;

@end