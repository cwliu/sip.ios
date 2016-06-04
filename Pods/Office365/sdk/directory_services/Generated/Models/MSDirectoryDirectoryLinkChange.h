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
#import "MSDirectoryDirectoryObject.h"

/**
* The header for type DirectoryLinkChange.
*/

@interface MSDirectoryDirectoryLinkChange : MSDirectoryDirectoryObject

@property (copy, nonatomic, readwrite, getter=associationType, setter=setAssociationType:) NSString *associationType;
@property (copy, nonatomic, readwrite, getter=sourceObjectId, setter=setSourceObjectId:) NSString *sourceObjectId;
@property (copy, nonatomic, readwrite, getter=sourceObjectType, setter=setSourceObjectType:) NSString *sourceObjectType;
@property (copy, nonatomic, readwrite, getter=sourceObjectUri, setter=setSourceObjectUri:) NSString *sourceObjectUri;
@property (copy, nonatomic, readwrite, getter=targetObjectId, setter=setTargetObjectId:) NSString *targetObjectId;
@property (copy, nonatomic, readwrite, getter=targetObjectType, setter=setTargetObjectType:) NSString *targetObjectType;
@property (copy, nonatomic, readwrite, getter=targetObjectUri, setter=setTargetObjectUri:) NSString *targetObjectUri;

@end