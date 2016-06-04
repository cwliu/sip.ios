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
* The implementation file for type MSGraphAppRoleAssignment.
*/

@implementation MSGraphAppRoleAssignment	

@synthesize odataType = _odataType;
@synthesize creationTimestamp = _creationTimestamp;
@synthesize id = _id;
@synthesize principalDisplayName = _principalDisplayName;
@synthesize principalId = _principalId;
@synthesize principalType = _principalType;
@synthesize resourceDisplayName = _resourceDisplayName;
@synthesize resourceId = _resourceId;

- (instancetype)init {

	if (self = [super init]) {

		_odataType = @"#Microsoft.Graph.AppRoleAssignment";
    }

	return self;
}

- (void)setCreationTimestamp:(NSDate *) creationTimestamp {
    _creationTimestamp = creationTimestamp;
	[self valueChanged:creationTimestamp forProperty:@"creationTimestamp"];
}
    
- (void)setId:(NSString *) id {
    _id = id;
	[self valueChanged:id forProperty:@"id"];
}
    
- (void)setPrincipalDisplayName:(NSString *) principalDisplayName {
    _principalDisplayName = principalDisplayName;
	[self valueChanged:principalDisplayName forProperty:@"principalDisplayName"];
}
    
- (void)setPrincipalId:(NSString *) principalId {
    _principalId = principalId;
	[self valueChanged:principalId forProperty:@"principalId"];
}
    
- (void)setPrincipalType:(NSString *) principalType {
    _principalType = principalType;
	[self valueChanged:principalType forProperty:@"principalType"];
}
    
- (void)setResourceDisplayName:(NSString *) resourceDisplayName {
    _resourceDisplayName = resourceDisplayName;
	[self valueChanged:resourceDisplayName forProperty:@"resourceDisplayName"];
}
    
- (void)setResourceId:(NSString *) resourceId {
    _resourceId = resourceId;
	[self valueChanged:resourceId forProperty:@"resourceId"];
}
    
@end