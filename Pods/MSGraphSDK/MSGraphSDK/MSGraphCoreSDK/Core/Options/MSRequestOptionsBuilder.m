// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSRequestOptionsBuilder.h"

@interface MSRequestOptionsBuilder()

@property (strong, nonatomic) NSMutableString *mutableQueryParams;
@property (strong, nonatomic) NSMutableString *mutableFunctionParams;
@property (strong, nonatomic) NSMutableDictionary *mutableHeaders;

@end

@implementation MSRequestOptionsBuilder

- (instancetype)init
{
    self = [super init];
    if (self){
        _mutableQueryParams = [NSMutableString new];
        _mutableFunctionParams = [NSMutableString new];
        _mutableHeaders = [NSMutableDictionary dictionary];
    }
    return self;
}

+ (instancetype)optionsWithArray:(NSArray *)options
{
    __block MSRequestOptionsBuilder *optionsBuilder = [[MSRequestOptionsBuilder alloc] init];
    
    [options enumerateObjectsUsingBlock:^(MSRequestOptions *option, NSUInteger index, BOOL *stop){

        [option appendOptionToHeaders:optionsBuilder.mutableHeaders];
        [option appendOptionToQueryString:optionsBuilder.mutableQueryParams];
        [option appendOptionToFunctionParams:optionsBuilder.mutableFunctionParams];

    }];
    
    if([optionsBuilder.mutableQueryParams length]>0) {
        NSRange range = NSMakeRange(0,1);
        [optionsBuilder.mutableQueryParams replaceCharactersInRange:range withString:@"?"];
    }
    
    if([optionsBuilder.mutableFunctionParams length]>0) {
        NSString *withParens = [NSString stringWithFormat:@"(%@)",[optionsBuilder.mutableFunctionParams substringFromIndex:1]];
        [optionsBuilder.mutableFunctionParams setString: withParens];
    }
    
    return optionsBuilder;
}

- (NSString *)queryOptions
{
    return _mutableQueryParams;
}

- (NSString *)functionParams
{
    return _mutableFunctionParams;
}

- (NSDictionary *)headers
{
    return _mutableHeaders;
}
@end
