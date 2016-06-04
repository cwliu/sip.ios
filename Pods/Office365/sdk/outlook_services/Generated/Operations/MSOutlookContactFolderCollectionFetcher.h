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
@class MSOutlookContactFolderFetcher;

#import <core/core.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookContactFolderCollectionFetcher.
*/

@interface MSOutlookContactFolderCollectionFetcher : MSOrcCollectionFetcher

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent;

- (MSOutlookContactFolderFetcher *)getById:(NSString *)Id;
- (void)add:(MSOutlookContactFolder *)entity callback:(void (^)(MSOutlookContactFolder *contactFolder, MSOrcError *error))callback;

- (MSOutlookContactFolderCollectionFetcher *)select:(NSString *)params;
- (MSOutlookContactFolderCollectionFetcher *)filter:(NSString *)params;
- (MSOutlookContactFolderCollectionFetcher *)search:(NSString *)params;
- (MSOutlookContactFolderCollectionFetcher *)top:(int)value;
- (MSOutlookContactFolderCollectionFetcher *)skip:(int)value;
- (MSOutlookContactFolderCollectionFetcher *)expand:(NSString *)value;
- (MSOutlookContactFolderCollectionFetcher *)orderBy:(NSString *)params;
- (MSOutlookContactFolderCollectionFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSOutlookContactFolderCollectionFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;

@end