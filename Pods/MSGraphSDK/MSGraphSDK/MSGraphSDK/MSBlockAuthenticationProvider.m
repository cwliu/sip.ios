// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSBlockAuthenticationProvider.h"

@interface MSBlockAuthenticationProvider ()
@property (nonatomic, copy) MSAuthenticationBlock authBlock;
@end

@implementation MSBlockAuthenticationProvider

+ (MSBlockAuthenticationProvider*)providerWithBlock:(void (^)(NSMutableURLRequest *, void (^)(NSMutableURLRequest*, NSError*)))block
{
    MSBlockAuthenticationProvider *provider = [[MSBlockAuthenticationProvider alloc] init];
    provider.authBlock = block;
    return provider;
}

- (void)appendAuthenticationHeaders:(NSMutableURLRequest *)request
                         completion:(void (^)(NSMutableURLRequest *, NSError *))completionHandler
{
    self.authBlock(request, completionHandler);
}

@end
