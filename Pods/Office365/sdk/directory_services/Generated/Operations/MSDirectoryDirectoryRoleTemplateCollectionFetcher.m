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
#import "MSDirectoryFetchers.h"

/**
* The implementation file for type MSDirectoryDirectoryRoleTemplateCollectionFetcher.
*/

@implementation MSDirectoryDirectoryRoleTemplateCollectionFetcher

- (instancetype)initWithUrl:(NSString *)urlComponent parent:(id<MSOrcExecutable>)parent {

    return [super initWithUrl:urlComponent parent:parent asClass:[MSDirectoryDirectoryRoleTemplate class]];
}

- (void)add:(MSDirectoryDirectoryRoleTemplate*)entity callback:(void (^)(MSDirectoryDirectoryRoleTemplate *directoryRoleTemplate, MSOrcError *error))callback {
	
	return [super add:entity callback:^(id entityAdded, MSOrcError *e) {

        callback(entityAdded,e);
    }];
}

- (MSDirectoryDirectoryRoleTemplateFetcher *)getById:(NSString *)id {

    return [[MSDirectoryDirectoryRoleTemplateFetcher alloc] initWithUrl:[[NSString alloc] initWithFormat:@"('%@')" ,id] parent:self];
}

- (MSDirectoryDirectoryRoleTemplateCollectionFetcher *)select:(NSString *)params {
    [super select:params];
    
    return self;
}

- (MSDirectoryDirectoryRoleTemplateCollectionFetcher *)filter:(NSString *)params{
    [super filter:params];
    
    return self;
}

- (MSDirectoryDirectoryRoleTemplateCollectionFetcher *)search:(NSString *)params {
    [super search:params];
    
    return self;
}

- (MSDirectoryDirectoryRoleTemplateCollectionFetcher *)top:(int)value {
    [super top:value];
    
    return self;
}

- (MSDirectoryDirectoryRoleTemplateCollectionFetcher *)skip:(int)value {
    [super skip:value];
    
    return self;
}

- (MSDirectoryDirectoryRoleTemplateCollectionFetcher *)expand:(NSString *)value {
    [super expand:value];
    
    return self;
}

- (MSDirectoryDirectoryRoleTemplateCollectionFetcher *)orderBy:(NSString *)params {
    [super orderBy:params];
    
    return self;
}

- (MSDirectoryDirectoryRoleTemplateCollectionFetcher *)addCustomParametersWithName:(NSString *)name value:(id)value {
    [super addCustomParametersWithName:name value:value];
    
    return self;
}

- (MSDirectoryDirectoryRoleTemplateCollectionFetcher *)addCustomHeaderWithName:(NSString *)name value:(NSString *)value {
    [super addCustomHeaderWithName:name value:value];
    
    return self;
}

@end