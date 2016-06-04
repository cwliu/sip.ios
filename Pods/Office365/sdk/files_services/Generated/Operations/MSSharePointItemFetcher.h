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
@class MSSharePointFileFetcher;
@class MSSharePointFolderFetcher;
@class MSSharePointItemOperations;

#import <core/core.h>
#import "MSSharePointModels.h"

/**
* The header for type MSSharePointItemFetcher.
*/


@interface MSSharePointItemFetcher : MSOrcEntityFetcher

@property (copy, nonatomic, readonly) MSSharePointItemOperations *operations;

- (instancetype)initWithUrl:(NSString*)urlComponent parent:(id<MSOrcExecutable>)parent;
- (void) readWithCallback:(void (^)(MSSharePointItem *item, MSOrcError *error))callback;
- (void)update:(MSSharePointItem *)item callback:(void(^)(MSSharePointItem *item, MSOrcError *error))callback;
- (void)delete:(void(^)(int status, MSOrcError *error))callback;
- (MSSharePointItemFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSSharePointItemFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;
- (MSSharePointItemFetcher *)select:(NSString *)params;
- (MSSharePointItemFetcher *)expand:(NSString *)value;
- (MSSharePointFileFetcher *)asFile;	
- (MSSharePointFolderFetcher *)asFolder;	

@end