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
#import "MSDirectoryModels.h"

/**
* The implementation file for type VerifiedDomain.
*/

@implementation MSDirectoryVerifiedDomain	

@synthesize odataType = _odataType;
@synthesize capabilities = _capabilities;
@synthesize $$__$$default = _$$__$$default;
@synthesize id = _id;
@synthesize initial = _initial;
@synthesize name = _name;
@synthesize type = _type;

- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.DirectoryServices.VerifiedDomain";
	}

	return self;
}

- (void)setCapabilities:(NSString *) capabilities {
    _capabilities = capabilities;
	[self valueChanged:capabilities forProperty:@"capabilities"];
}
    
- (void)setDefault:(BOOL ) $$__$$default {
    _$$__$$default = $$__$$default;
    [self valueChangedForBool:$$__$$default forProperty:@"$$__$$default"];
}
    
- (void)setId:(NSString *) id {
    _id = id;
	[self valueChanged:id forProperty:@"id"];
}
    
- (void)setInitial:(BOOL ) initial {
    _initial = initial;
    [self valueChangedForBool:initial forProperty:@"initial"];
}
    
- (void)setName:(NSString *) name {
    _name = name;
	[self valueChanged:name forProperty:@"name"];
}
    
- (void)setType:(NSString *) type {
    _type = type;
	[self valueChanged:type forProperty:@"type"];
}
    
@end