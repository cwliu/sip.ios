// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import <Foundation/Foundation.h>

/**
 `MSRequestOptions` will store a key value pair used to append to a request
 ##Subclassing Notes
 Subclassed by MSQueryParameters and MSHeaderOptions
 @warning When subclassing you MUST implement appendOptions:queryParams:
 
 @see MSQueryParameters
 @see MSHeaderOptions
 */
@interface MSRequestOptions : NSObject

/**
 The key of the option
 */
@property (strong, nonatomic) NSString *key;

/**
 The value of the option
 */
@property (strong, nonatomic) NSString *value;

/**
 Creates an instance of an `MSRequestOptions` object
 @param key the key of the option
 @param value the value of the option
 */
- (instancetype)initWithKey:(NSString *)key value:(NSString *)value;

- (void)appendOptionToHeaders: (NSMutableDictionary *)headers;
- (void)appendOptionToQueryString: (NSMutableString *) queryString;
- (void)appendOptionToFunctionParams: (NSMutableString *) functionParams;


@end

