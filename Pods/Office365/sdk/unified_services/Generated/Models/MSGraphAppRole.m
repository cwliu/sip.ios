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
#import "MSGraphModels.h"

/**
* The implementation file for type AppRole.
*/

@implementation MSGraphAppRole	

@synthesize odataType = _odataType;
@synthesize allowedMemberTypes = _allowedMemberTypes;
@synthesize $$__$$description = _$$__$$description;
@synthesize displayName = _displayName;
@synthesize id = _id;
@synthesize isEnabled = _isEnabled;
@synthesize value = _value;

- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.Graph.AppRole";
		_allowedMemberTypes  = [[NSMutableArray alloc] initWithCollectionType:@"MSGraphString"];
	}

	return self;
}

- (void)setAllowedMemberTypes:(NSMutableArray *) allowedMemberTypes {
    _allowedMemberTypes = allowedMemberTypes;
	[self valueChanged:allowedMemberTypes forProperty:@"allowedMemberTypes"];
}
    
- (void)setDescription:(NSString *) $$__$$description {
    _$$__$$description = $$__$$description;
	[self valueChanged:$$__$$description forProperty:@"$$__$$description"];
}
    
- (void)setDisplayName:(NSString *) displayName {
    _displayName = displayName;
	[self valueChanged:displayName forProperty:@"displayName"];
}
    
- (void)setId:(NSString *) id {
    _id = id;
	[self valueChanged:id forProperty:@"id"];
}
    
- (void)setIsEnabled:(BOOL ) isEnabled {
    _isEnabled = isEnabled;
    [self valueChangedForBool:isEnabled forProperty:@"isEnabled"];
}
    
- (void)setValue:(NSString *) value {
    _value = value;
	[self valueChanged:value forProperty:@"value"];
}
    
@end