// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import <Foundation/Foundation.h>

/**
 *  LogLevels for the logger.
 */
typedef NS_ENUM(NSInteger, MSLogLevel){
    MSLogLevelLogError = 0,
    MSLogLevelLogWarn,
    MSLogLevelLogInfo,
    MSLogLevelLogDebug,
    MSLogLevelLogVerbose
};

/**
 `MSLogger` is a protocol to use for simple logging.
 
 ## Usage
 
 The logger should only log messages when they are at the same level or below the level of the logger.
 
        [logger setLogLevel:MSLogLevelLogInfo];
        [logger logWithLevel:MSLogWarn message:@"This should get logged"]; // logs " GraphSDK WARNING: This should get logged"
        [logger logWithLevel:MSLogVerbose message:@"This won't get logged"]; // doesn't log anything because Verbose is higher than Info
        [logger logWithLevel:MSLogError message:@"Print the error object : %@", error]; //logs and prints the error object
 

 */
@protocol MSLogger <NSObject>

/**
 Sets the logging level of the logger.
 @param logLevel The level to start logging.
 @see MSLogLevel
 */
- (void)setLogLevel:(MSLogLevel)logLevel;

/**
 Logs the message at the current level.
 @param level The level to log the message at @see MSLogLevel.
 @param messageFormat A string or format string and objects for the format string.
 @warning You should only log messages if the logLevel of the logger is set to that level or below.
 */
- (void)logWithLevel:(MSLogLevel)level message:(NSString *)messageFormat, ...;

@end
