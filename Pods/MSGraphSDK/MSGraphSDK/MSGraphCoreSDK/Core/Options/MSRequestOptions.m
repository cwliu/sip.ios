// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSRequestOptions.h"

@interface MSRequestOptions()

@property (strong, nonatomic) NSMutableDictionary *mutableHeaders;

@property (strong, nonatomic) NSMutableString *mutableQueryParamString;

@end

@implementation MSRequestOptions

- (instancetype)initWithKey:(NSString *)key value:(NSString *)value
{
    self = [super init];
    if (self){
        _key = key;
        _value = value;
    }
    return self;
}

- (void)appendOptionToHeaders: (NSMutableDictionary *)headers
{

}

- (void)appendOptionToQueryString: (NSMutableString *) queryString
{

}

- (void)appendOptionToFunctionParams: (NSMutableString *) functionParams
{

}

@end
