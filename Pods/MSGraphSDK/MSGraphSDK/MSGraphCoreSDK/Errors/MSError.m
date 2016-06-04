// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSError.h"

static NSString *const code = @"code";
static NSString *const message = @"message";
static NSString *const innerError = @"innererror";

@implementation MSError

- (instancetype)initWithDictionary:(NSDictionary *)dictionary
{
    // any error dictionary that doesn't contain a code is malformed
    self = [super init];
    if (self){
        if (dictionary && dictionary[code]){
            _code = dictionary[code];
            _message = dictionary[message];
            if (dictionary[innerError]){
                _innerError = [MSError errorWithDictionary:dictionary[innerError]];
            }
        }
        else{
            _code = MSMalformedErrorResponseError;
        }
    }
    return self;
}

+ (instancetype)errorWithDictionary:(NSDictionary *)dictionary
{
    return [[MSError alloc] initWithDictionary:dictionary];
}

- (BOOL)matches:(NSString *)code
{
    BOOL matches = NO;
    // start at the inner most error
    if (self.innerError){
        matches = [self.innerError matches:code];
    }
    if (!matches){
        matches = [self.code isEqualToString:code];
    }
    return matches;
}

- (NSString *)description
{
    return [NSString stringWithFormat:@" %@ : %@", self.code, self.message];
}

@end
