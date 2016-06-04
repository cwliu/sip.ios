// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSIfNoneMatch.h"

@implementation MSIfNoneMatch

+ (instancetype) entityTags:(NSString *)eTags
{
    return [[MSIfNoneMatch alloc] initWithKey:@"If-None-Match" value:eTags];
}

@end
