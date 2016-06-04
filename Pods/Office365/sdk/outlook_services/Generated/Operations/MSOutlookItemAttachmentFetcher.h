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
@class MSOutlookItemFetcher;
@class MSOutlookItemAttachmentOperations;

#import <core/core.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookItemAttachmentFetcher.
*/


@interface MSOutlookItemAttachmentFetcher : MSOrcEntityFetcher

@property (copy, nonatomic, readonly) MSOutlookItemAttachmentOperations *operations;

- (instancetype)initWithUrl:(NSString*)urlComponent parent:(id<MSOrcExecutable>)parent;
- (void) readWithCallback:(void (^)(MSOutlookItemAttachment *itemAttachment, MSOrcError *error))callback;
- (void)update:(MSOutlookItemAttachment *)itemAttachment callback:(void(^)(MSOutlookItemAttachment *itemAttachment, MSOrcError *error))callback;
- (void)delete:(void(^)(int status, MSOrcError *error))callback;
- (MSOutlookItemAttachmentFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSOutlookItemAttachmentFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;
- (MSOutlookItemAttachmentFetcher *)select:(NSString *)params;
- (MSOutlookItemAttachmentFetcher *)expand:(NSString *)value;

@property (retain, nonatomic, readonly, getter=item) MSOutlookItemFetcher *item;

@end