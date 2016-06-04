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
@class MSOneNoteNotebookFetcher;
@class MSOneNoteNotebookCollectionFetcher;
@class MSOneNoteSectionFetcher;
@class MSOneNoteSectionCollectionFetcher;
@class MSOneNoteSectionGroupFetcher;
@class MSOneNoteSectionGroupCollectionFetcher;
@class MSOneNotePageFetcher;
@class MSOneNotePageCollectionFetcher;
@class MSOneNoteResourceFetcher;
@class MSOneNoteResourceCollectionFetcher;
@class MSOneNoteNotesOperations;

#import <core/core.h>
#import "MSOneNoteModels.h"

/**
* The header for type MSOneNoteNotesFetcher.
*/


@interface MSOneNoteNotesFetcher : MSOrcEntityFetcher

@property (copy, nonatomic, readonly) MSOneNoteNotesOperations *operations;

- (instancetype)initWithUrl:(NSString*)urlComponent parent:(id<MSOrcExecutable>)parent;
- (void) readWithCallback:(void (^)(MSOneNoteNotes *notes, MSOrcError *error))callback;
- (void)update:(MSOneNoteNotes *)notes callback:(void(^)(MSOneNoteNotes *notes, MSOrcError *error))callback;
- (void)delete:(void(^)(int status, MSOrcError *error))callback;
- (MSOneNoteNotesFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSOneNoteNotesFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;
- (MSOneNoteNotesFetcher *)select:(NSString *)params;
- (MSOneNoteNotesFetcher *)expand:(NSString *)value;
@property (retain, nonatomic, readonly, getter=notebooks) MSOneNoteNotebookCollectionFetcher *notebooks;

- (MSOneNoteNotebookFetcher *)getNotebooksById:(NSString*)id;

@property (retain, nonatomic, readonly, getter=sections) MSOneNoteSectionCollectionFetcher *sections;

- (MSOneNoteSectionFetcher *)getSectionsById:(NSString*)id;

@property (retain, nonatomic, readonly, getter=sectionGroups) MSOneNoteSectionGroupCollectionFetcher *sectionGroups;

- (MSOneNoteSectionGroupFetcher *)getSectionGroupsById:(NSString*)id;

@property (retain, nonatomic, readonly, getter=pages) MSOneNotePageCollectionFetcher *pages;

- (MSOneNotePageFetcher *)getPagesById:(NSString*)id;

@property (retain, nonatomic, readonly, getter=resources) MSOneNoteResourceCollectionFetcher *resources;

- (MSOneNoteResourceFetcher *)getResourcesById:(NSString*)id;


@end