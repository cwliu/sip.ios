// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import <Foundation/Foundation.h>
#import "MSLoggerProtocol.h"

/**
 Simple Logger for the GraphSDK will log everything to the console using NSLog
 
 ## Writing to a File 
 
 If you wish to log to a file instead of the console, it is easiest to subclass the MSLogger and overload writeMessage:
 This method will have the constructed string passed into the [MSLogger logWithLevel:message:] method and passed it along
 to the writeMessage: method


 @see writeMessage:
 
 */
@interface MSLogger : NSObject <MSLogger>

/**
 Creates the logger with the given level
 @param level the level to create the logger with
 @see MSLogLevel
 */
- (instancetype)initWithLogLevel:(MSLogLevel)level;

/**
 The current log level
 Use setLogLevel to set the logLevel
 @see setLogLevel:
 */
@property (readonly) MSLogLevel logLevel;

/**
 Actually writes the full log message.  This will just call NSLog with the message.
 @param  message the message to log
 */
- (void)writeMessage:(NSString *)message;

@end
