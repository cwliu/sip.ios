// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "ODataBaseClient.h"

@implementation ODataBaseClient

-(instancetype)initWithURL:(NSString *)url httpProvider:(id<MSHttpProvider>)httpProvider authenticationProvider:(id<MSAuthenticationProvider>)authenticationProvider
{
    self = [super init];
    if (self){
        _baseURL = [NSURL URLWithString:url];
        _httpProvider = httpProvider;
        _authenticationProvider = authenticationProvider;
    }
    return self;
}

@end
