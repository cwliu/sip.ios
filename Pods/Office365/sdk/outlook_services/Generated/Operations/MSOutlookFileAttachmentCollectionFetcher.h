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
@class MSOutlookFileAttachmentFetcher;

#import <core/core.h>
#import "MSOutlookModels.h"

/**
* The header for type MSOutlookFileAttachmentCollectionFetcher.
*/

@interface MSOutlookFileAttachmentCollectionFetcher : MSOrcCollectionFetcher

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent;

- (MSOutlookFileAttachmentFetcher *)getById:(NSString *)Id;
- (void)add:(MSOutlookFileAttachment *)entity callback:(void (^)(MSOutlookFileAttachment *fileAttachment, MSOrcError *error))callback;

- (MSOutlookFileAttachmentCollectionFetcher *)select:(NSString *)params;
- (MSOutlookFileAttachmentCollectionFetcher *)filter:(NSString *)params;
- (MSOutlookFileAttachmentCollectionFetcher *)search:(NSString *)params;
- (MSOutlookFileAttachmentCollectionFetcher *)top:(int)value;
- (MSOutlookFileAttachmentCollectionFetcher *)skip:(int)value;
- (MSOutlookFileAttachmentCollectionFetcher *)expand:(NSString *)value;
- (MSOutlookFileAttachmentCollectionFetcher *)orderBy:(NSString *)params;
- (MSOutlookFileAttachmentCollectionFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value;
- (MSOutlookFileAttachmentCollectionFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value;

@end