// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import <Foundation/Foundation.h>

#import "MSGraphClient.h"
#import "MSGraphClientConfiguration.h"

@interface MSGraphClient (Base)

/**
 Creates a client using settings defined in the provided config
 @warning With this method, the onus is on the developer to ensure the MSAuthenticationProvider is in a state ready to create auth headers before making client requests.
 */
+(MSGraphClient*)clientWithConfig:(MSGraphClientConfiguration*)config;

@end
