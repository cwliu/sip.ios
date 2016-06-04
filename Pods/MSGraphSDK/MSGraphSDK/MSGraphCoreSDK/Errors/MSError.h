// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import <Foundation/Foundation.h>

#import "MSErrorCodes.h"

/**
 This class is used to represent client errors from the Graph service
 @see MSErrorCodes.h for specific error codes
 */
@interface MSError : NSObject
/**
 Creates an MSError with the given dictionary
 @param dictionary the error dictionary
 */
+ (instancetype)errorWithDictionary:(NSDictionary *)dictionary;

/**
 The error code returned from the service
 @see MSErrorCodes.h for errors
 */
@property NSString *code;

/**
 The message from the error, this is not to be displayed to the user
 */
@property NSString *message;

/**
 The inner error may contain more detailed information about the error
 */
@property MSError *innerError;

/**
 @param code the error code
 @return YES if the code matches the error or one of the inner errors
 @return NO if the code doesn't match the error or any of its inner errors
 @see ODErrorCodes.h
 */
- (BOOL)matches:(NSString*)code;

@end
