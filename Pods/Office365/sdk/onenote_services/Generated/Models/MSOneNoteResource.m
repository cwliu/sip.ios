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

#import "MSOneNoteModels.h"

/**
* The implementation file for type MSOneNoteResource.
*/

@implementation MSOneNoteResource	

@synthesize odataType = _odataType;
@synthesize id = _id;
@synthesize $$__$$self = _$$__$$self;
@synthesize content = _content;
@synthesize contentUrl = _contentUrl;

- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.OneNote.Api.Resource";
    }

	return self;
}

- (void)setId:(NSString *) id {
    _id = id;
	[self valueChanged:id forProperty:@"id"];
}
    
- (void)setSelf:(NSString *) $$__$$self {
    _$$__$$self = $$__$$self;
	[self valueChanged:$$__$$self forProperty:@"$$__$$self"];
}
    
- (void)setContent:(NSStream *) content {
    _content = content;
	[self valueChanged:content forProperty:@"content"];
}
    
- (void)setContentUrl:(NSString *) contentUrl {
    _contentUrl = contentUrl;
	[self valueChanged:contentUrl forProperty:@"contentUrl"];
}
    
@end