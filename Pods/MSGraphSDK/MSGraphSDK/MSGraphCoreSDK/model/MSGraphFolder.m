// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "NSDate+MSSerialization.h"

#import "MSGraphModels.h"

@interface MSObject()

@property (strong, nonatomic) NSMutableDictionary *dictionary;

@end

@interface MSGraphFolder()
{
    int32_t _childCount;
}
@end

@implementation MSGraphFolder

- (int32_t) childCount
{
    _childCount = [self.dictionary[@"childCount"] intValue];
    return _childCount;
}
- (void) setChildCount: (int32_t) val
{
    _childCount = val;
    self.dictionary[@"childCount"] = @(val);
}
@end
