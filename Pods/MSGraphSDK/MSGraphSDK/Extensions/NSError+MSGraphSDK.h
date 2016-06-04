// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

@class MSError;

#import <Foundation/Foundation.h>

/**
 Helper methods to determine the type of error received.
 ## Usage

 
        [[[[client drive] items:@"foo"] request] getWithCompletion:^(MSItem *response, NSError *error){
             if ([error isClientError]){
                 [self handleClientError:[error clientError]];
             }
             else {
                 [self handleUnknownError:error]
             }
         }];
 
 */
@interface NSError (MSGraphSDK)

/**
 @return YES if the error was a client error.
 @return NO if the error was not a client error.
 */
- (BOOL)isClientError;

/**
 @return The Client error if there was one (see MSError.h).
 @return nil if it was not a client error.
 */
- (MSError *)clientError;

@end

