// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSNameConflict.h"

static NSString *const conflictBehaviorKey = @"@name.conflictBehavior";
static NSString *const failBehavior = @"fail";
static NSString *const replaceBehavior = @"replace";
static NSString *const renameBehavior = @"rename";

@implementation MSNameConflict

+ (instancetype)fail
{
    return [MSNameConflict conflictBehaviorWithValue:[failBehavior copy]];
}

+ (instancetype)replace
{
    return [MSNameConflict conflictBehaviorWithValue:[replaceBehavior copy]];
}

+ (instancetype)rename
{
    return [MSNameConflict conflictBehaviorWithValue:[renameBehavior copy]];
}
           
+ (instancetype)conflictBehaviorWithValue:(NSString *)value
{
    return [[MSNameConflict alloc] initWithKey:[conflictBehaviorKey copy] value:value];
}
           
@end
