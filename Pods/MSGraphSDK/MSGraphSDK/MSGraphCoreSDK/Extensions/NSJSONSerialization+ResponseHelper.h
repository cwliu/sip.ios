// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import <Foundation/Foundation.h>

@interface NSJSONSerialization (ResponseHelper)

+ (NSDictionary *)dictionaryWithResponse:(NSURLResponse *)response responseData:(NSData *)data error:(NSError * __autoreleasing *)error;

+ (NSError *)errorFromResponse:(NSURLResponse *)response responseObject:(NSDictionary *)responseObject;

+ (NSError *)errorWithStatusCode:(NSInteger)statusCode responseDictionary:(NSDictionary *)responseDictionary;

@end
