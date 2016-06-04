// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "NSJSONSerialization+ResponseHelper.h"
#import "MSConstants.h"
#import "MSError.h"

@implementation NSJSONSerialization (ResponseHelper)

+ (NSDictionary *)dictionaryWithResponse:(NSURLResponse *)response responseData:(NSData *)data error:(NSError * __autoreleasing *)error
{
    NSParameterAssert(response);
    
    NSDictionary *responseDictionary = nil;
    NSError *parseError = nil;
    NSInteger statusCode = ((NSHTTPURLResponse*)response).statusCode;
    
    //make sure we don't try and parse bad nothing
    if (data && [data bytes]){
        responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&parseError];
    }
    // if there was a parse error and the caller wants the error to be set
    if (parseError && error){
        *error = parseError;
    }
    // try and parse the client error
    else if ((statusCode < 200 || statusCode > 299) && error) {
        *error = [NSJSONSerialization errorWithStatusCode:statusCode responseDictionary:responseDictionary];
    }
    // if an error occurred we shouldn't return the json response
    if (error && *error){
        responseDictionary = nil;
    }
    
    return responseDictionary;
}

+ (NSError *)errorWithStatusCode:(NSInteger)statusCode responseDictionary:(NSDictionary *)responseDictionary
{
    NSParameterAssert(statusCode);
    
    NSMutableDictionary *userInfo = [NSMutableDictionary dictionary];
    userInfo[NSLocalizedDescriptionKey] = [NSHTTPURLResponse localizedStringForStatusCode:(NSInteger)statusCode];
    MSError *responseError = nil;
    if (responseDictionary){
        responseError = [MSError errorWithDictionary:responseDictionary[MSErrorKey]];
    }
    if (responseError){
        userInfo[MSErrorKey] = responseError;
    }
    return [NSError errorWithDomain:MSErrorDomain code:statusCode userInfo:userInfo];
}

+ (NSError *)errorFromResponse:(NSURLResponse *)response responseObject:(NSDictionary *)responseObject
{
    NSInteger statusCode = ((NSHTTPURLResponse *)response).statusCode;
    if (statusCode < 200 || statusCode > 299){
        return [NSJSONSerialization errorWithStatusCode:statusCode responseDictionary:@{}];
    }
    return nil;
}

@end
