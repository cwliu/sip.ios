// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSSelectOptions.h"

@implementation MSSelectOptions

+ (instancetype) select:(NSString *)string
{
    return [[MSSelectOptions alloc]  initWithKey:@"$select" value:string];
}


@end
