// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSQueryParameters.h"

@implementation MSQueryParameters

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

- (void)appendOptionToQueryString: (NSMutableString *)queryString
{
    NSString *encodedValue = [self.value stringByAddingPercentEncodingWithAllowedCharacters:[MSQueryParameters allowedChars]];
    [queryString appendFormat:@"&%@=%@",self.key,encodedValue];
}

@end
