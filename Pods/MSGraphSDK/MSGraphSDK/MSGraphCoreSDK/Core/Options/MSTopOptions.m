// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSTopOptions.h"

@implementation MSTopOptions

+ (instancetype) top:(NSInteger)top
{
    return [[MSTopOptions alloc] initWithKey:@"$top" value:[NSString stringWithFormat:@"%ld",(long)top]];
}

@end
