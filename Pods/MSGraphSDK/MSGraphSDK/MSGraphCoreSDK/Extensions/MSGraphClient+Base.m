// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSGraphClient+Base.h"

@implementation MSGraphClient (Base)

+ (MSGraphClient*)clientWithConfig:(MSGraphClientConfiguration *)config {
    NSParameterAssert(config.apiEndpoint);
    NSParameterAssert(config.httpProvider);
    NSParameterAssert(config.authenticationProvider);
    MSGraphClient *client = [[MSGraphClient alloc] initWithURL:config.apiEndpoint
                                                  httpProvider:config.httpProvider
                                        authenticationProvider:config.authenticationProvider];
    client.logger = config.logger;
    return client;
}

@end
