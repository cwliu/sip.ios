// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSIfMatch.h"

@implementation MSIfMatch

+ (instancetype) entityTags:(NSString *)eTags
{
    return [[MSIfMatch alloc] initWithKey:@"If-Match" value:eTags];
}

@end
