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

@class MSOneNoteNotebookLinks;
@class MSOneNoteSection;
@class MSOneNoteSectionGroup;

#import <Foundation/Foundation.h>
#import "MSOneNoteUserRole.h"
#import "MSOrcBaseEntity.h"

/**
* The header for type Notebook.
*/

@interface MSOneNoteNotebook : MSOrcBaseEntity

@property (nonatomic, getter=isDefault, setter=setIsDefault:) BOOL isDefault;
@property  (nonatomic, getter=userRole, setter=setUserRole:) MSOneNoteUserRole userRole;
- (void)setuserRoleString:(NSString *)value;
@property (nonatomic, getter=isShared, setter=setIsShared:) BOOL isShared;
@property (copy, nonatomic, readwrite, getter=sectionsUrl, setter=setSectionsUrl:) NSString *sectionsUrl;
@property (copy, nonatomic, readwrite, getter=sectionGroupsUrl, setter=setSectionGroupsUrl:) NSString *sectionGroupsUrl;
@property (copy, nonatomic, readwrite, getter=links, setter=setLinks:) MSOneNoteNotebookLinks *links;
@property (copy, nonatomic, readwrite, getter=name, setter=setName:) NSString *name;
@property (copy, nonatomic, readwrite, getter=createdBy, setter=setCreatedBy:) NSString *createdBy;
@property (copy, nonatomic, readwrite, getter=lastModifiedBy, setter=setLastModifiedBy:) NSString *lastModifiedBy;
@property (copy, nonatomic, readwrite, getter=lastModifiedTime, setter=setLastModifiedTime:) NSDate *lastModifiedTime;
@property (copy, nonatomic, readwrite, getter=id, setter=setId:) NSString *id;
@property (copy, nonatomic, readwrite, getter=self, setter=setSelf:) NSString *$$__$$self;
@property (copy, nonatomic, readwrite, getter=createdTime, setter=setCreatedTime:) NSDate *createdTime;
@property (copy, nonatomic, readwrite, getter=sections, setter=setSections:) NSMutableArray *sections;
@property (copy, nonatomic, readwrite, getter=sectionGroups, setter=setSectionGroups:) NSMutableArray *sectionGroups;

@end