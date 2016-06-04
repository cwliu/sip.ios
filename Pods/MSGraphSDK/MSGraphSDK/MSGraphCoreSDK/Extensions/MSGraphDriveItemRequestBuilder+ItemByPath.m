// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSGraphDriveItemRequestBuilder+ItemByPath.h"

@implementation MSGraphDriveItemRequestBuilder (ItemByPath)

- (MSGraphDriveItemRequestBuilder *)itemByPath:(NSString *)path
{
    
    NSString *encPath = [path stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLPathAllowedCharacterSet]];
    NSString *fullPath = [NSString stringWithFormat:@"%@:/%@:/", self.requestURL, encPath];
    return [[MSGraphDriveItemRequestBuilder alloc] initWithURL:[NSURL URLWithString:fullPath] client:self.client];
}

@end
