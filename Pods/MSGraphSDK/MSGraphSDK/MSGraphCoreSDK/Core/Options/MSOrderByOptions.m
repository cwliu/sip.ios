// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSOrderByOptions.h"

@implementation MSOrderByOptions

+ (instancetype) orderBy:(NSString *)orderBy
{
    return [[MSOrderByOptions alloc] initWithKey:@"$orderby" value:orderBy];
}

@end
