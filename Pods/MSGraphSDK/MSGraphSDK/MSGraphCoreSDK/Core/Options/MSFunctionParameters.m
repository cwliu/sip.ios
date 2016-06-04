// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSFunctionParameters.h"

@implementation MSFunctionParameters

+ (NSCharacterSet*) allowedChars {
    static NSCharacterSet *allowed;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSMutableCharacterSet *temp = [[NSCharacterSet URLQueryAllowedCharacterSet] mutableCopy];
        [temp removeCharactersInString:@"?+=&"];
        allowed = temp;
    });
    return allowed;
}

- (void)appendOptionToFunctionParams: (NSMutableString *) functionParams
{
    NSString *formattedValue;
    if ([self.value isKindOfClass:[NSString class]]) {
        formattedValue = [NSString stringWithFormat:@"'%@'", self.value];
    }
    else if ([self.value isKindOfClass: [NSNull class]]) {
        formattedValue = @"null";
    }
    else {
        formattedValue = [NSString stringWithFormat:@"%@", self.value];
    }
    
    NSString *encodedValue = [formattedValue stringByAddingPercentEncodingWithAllowedCharacters:[MSFunctionParameters allowedChars]];

    [functionParams appendFormat:@",%@=%@", self.key, encodedValue];
}

@end
