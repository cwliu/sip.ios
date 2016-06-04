// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSHeaderOptions.h"

@implementation MSHeaderOptions

- (void)appendOptionToHeaders: (NSMutableDictionary *)headers;
{
    headers[self.key] = self.value;
}

@end
