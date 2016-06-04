// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSRequestBuilder.h"

@implementation MSRequestBuilder

- (instancetype)initWithURL:(NSURL *)url client:(ODataBaseClient *)client;
{
    NSParameterAssert(url);
    NSParameterAssert(client);
    
    self = [super init];
    if (self){
        _requestURL = url;
        _client = client;
    }
    return self;
}

@end
