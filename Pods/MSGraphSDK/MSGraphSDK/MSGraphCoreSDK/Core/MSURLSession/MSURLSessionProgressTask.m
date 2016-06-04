// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSURLSessionProgressTask.h"

@implementation MSURLSessionProgressTask

- (NSProgress *)createProgress
{
    NSProgress *progress = [NSProgress progressWithTotalUnitCount:0];
    _progress = progress;
    return progress;
}

@end
