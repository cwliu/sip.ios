// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSGraphClientConfiguration+DefaultConfiguration.h"
#import "MSConstants.h"
#import "MSURLSessionManager.h"
#import "MSLogger.h"

@implementation MSGraphClientConfiguration (DefaultConfiguration)

+ (instancetype)defaultConfiguration
{
    static MSGraphClientConfiguration *sharedConfig = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        // Default values for the shared configuration
        sharedConfig = [[MSGraphClientConfiguration alloc] init];
        sharedConfig.httpProvider = [[MSURLSessionManager alloc] initWithSessionConfiguration:[NSURLSessionConfiguration defaultSessionConfiguration]];
        sharedConfig.logger = [[MSLogger alloc] initWithLogLevel:MSLogLevelLogError];
        sharedConfig.apiEndpoint = [NSString stringWithFormat:@"%@/%@", MSGraphApiEndpoint, MSGraphApiVersion];
    });
    return sharedConfig;
}

@end
