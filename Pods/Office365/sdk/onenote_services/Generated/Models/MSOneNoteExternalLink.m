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
* The implementation file for type ExternalLink.
*/

@implementation MSOneNoteExternalLink	

@synthesize odataType = _odataType;
@synthesize href = _href;

- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.OneNote.Api.ExternalLink";
	}

	return self;
}

- (void)setHref:(NSString *) href {
    _href = href;
	[self valueChanged:href forProperty:@"href"];
}
    
@end