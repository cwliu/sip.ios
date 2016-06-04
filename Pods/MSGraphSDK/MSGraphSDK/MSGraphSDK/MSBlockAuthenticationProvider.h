// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import <Foundation/Foundation.h>
#import "MSAuthenticationProvider.h"

typedef void (^MSAuthenticationBlock) (NSMutableURLRequest *request, MSAuthenticationCompletion completion);

@interface MSBlockAuthenticationProvider : NSObject <MSAuthenticationProvider>

+ (MSBlockAuthenticationProvider*)providerWithBlock:(MSAuthenticationBlock)block;

@end
