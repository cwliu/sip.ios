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

@class MSOneNoteNotebook;
@class MSOneNoteSection;
@class MSOneNoteSectionGroup;
@class MSOneNotePage;
@class MSOneNoteResource;

#import <Foundation/Foundation.h>
#import "MSOrcBaseEntity.h"

/**
* The header for type Notes.
*/

@interface MSOneNoteNotes : MSOrcBaseEntity

@property (copy, nonatomic, readwrite, getter=id, setter=setId:) NSString *id;
@property (copy, nonatomic, readwrite, getter=notebooks, setter=setNotebooks:) NSMutableArray *notebooks;
@property (copy, nonatomic, readwrite, getter=sections, setter=setSections:) NSMutableArray *sections;
@property (copy, nonatomic, readwrite, getter=sectionGroups, setter=setSectionGroups:) NSMutableArray *sectionGroups;
@property (copy, nonatomic, readwrite, getter=pages, setter=setPages:) NSMutableArray *pages;
@property (copy, nonatomic, readwrite, getter=resources, setter=setResources:) NSMutableArray *resources;

@end