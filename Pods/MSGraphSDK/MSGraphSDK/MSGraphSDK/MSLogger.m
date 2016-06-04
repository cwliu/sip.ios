// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSLogger.h"
#include <stdarg.h>

@implementation MSLogger


- (instancetype)initWithLogLevel:(MSLogLevel)level
{
    self = [super init];
    if (self){
        _logLevel = level;
    }
    return self;
}

- (void)setLogLevel:(MSLogLevel)logLevel
{
    _logLevel = logLevel;
}

- (void)logWithLevel:(MSLogLevel)level message:(NSString *)messageFormat, ...
{
    if (level <= self.logLevel){
        va_list args;
        va_start(args, messageFormat);
        NSString *logLevel = nil;
        switch (level) {
            case MSLogLevelLogError:
                logLevel = @"ERROR :";
                break;
            case MSLogLevelLogWarn:
                logLevel = @"WARNING :";
                break;
            case MSLogLevelLogInfo:
                logLevel = @"INFO :";
                break;
            case MSLogLevelLogDebug:
                logLevel = @"DEBUG : ";
                break;
            case MSLogLevelLogVerbose:
                logLevel = @"VERBOSE :";
                break;
            default:
                break;
        }
        NSString *message = nil;
        if (messageFormat){
            NSString *stringFormat = [NSString stringWithFormat:@"Graph SDK %@ %@", logLevel, messageFormat];
           message = [[NSString alloc] initWithFormat:stringFormat arguments:args];
        }
        [self writeMessage:message];
        va_end(args);
    }
}

- (void)writeMessage:(NSString *)message
{
    NSLog(@"%@", message);
}
@end
