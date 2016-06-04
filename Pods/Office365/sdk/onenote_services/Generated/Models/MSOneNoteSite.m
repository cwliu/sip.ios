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
* The implementation file for type MSOneNoteSite.
*/

@implementation MSOneNoteSite	

@synthesize odataType = _odataType;
@synthesize id = _id;
@synthesize notes = _notes;

- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.OneNote.Api.Site";
    }

	return self;
}

- (void)setId:(NSString *) id {
    _id = id;
	[self valueChanged:id forProperty:@"id"];
}
    
- (void)setNotes:(MSOneNoteNotes *) notes {
    _notes = notes;
	[self valueChanged:notes forProperty:@"notes"];
}
    
@end