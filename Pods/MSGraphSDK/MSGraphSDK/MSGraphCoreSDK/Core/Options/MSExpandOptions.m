// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSExpandOptions.h"

@implementation MSExpandOptions

+ (instancetype) expand:(NSString *)expand
{
    return [[MSExpandOptions alloc] initWithKey:@"$expand" value:expand];
}

@end
