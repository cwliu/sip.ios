// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSURLSessionDataTask.h"

@interface MSRequest()

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      body:(NSData *)body
                                   headers:(NSDictionary *)headers;

- (NSMutableURLRequest *)requestWithURL:(NSURL *)url
                                 method:(NSString *)method
                                   body:(NSData *)body
                                headers:(NSDictionary *)headers;

- (MSURLSessionDataTask*)taskWithRequest:(NSMutableURLRequest *)request
                                completion:(void (^)(NSDictionary *dictionary, NSError *error))completionHandler;

@end

@implementation MSGraphEventMessageRequest


- (NSMutableURLRequest *)get
{
    return [self requestWithMethod:@"GET"
                              body:nil
                           headers:nil];
}

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphEventMessage *response, NSError *error))completionHandler
{
    MSURLSessionDataTask *task = [self taskWithRequest:[self get]
                                odObjectWithDictionary:^(NSDictionary *response){
                                            return [[MSGraphEventMessage alloc] initWithDictionary:response];
                                        }
                                             completion:completionHandler];
    [task execute];
    return task;
}



- (NSMutableURLRequest *)update:(MSGraphEventMessage *)eventMessage
{
    NSData *body = [NSJSONSerialization dataWithJSONObject:[eventMessage dictionaryFromItem] options:0 error:nil];
    return [self requestWithMethod:@"PATCH"
                              body:body
                           headers:nil];
}

- (MSURLSessionDataTask *)update:(MSGraphEventMessage *)eventMessage withCompletion:(void (^)(MSGraphEventMessage *response, NSError *error))completionHandler
{
    MSURLSessionDataTask *task = [self taskWithRequest:[self update:eventMessage]
                                odObjectWithDictionary:^(NSDictionary *response){
                                            return [[MSGraphEventMessage alloc] initWithDictionary:response];
                                        }
                                              completion:completionHandler];
    [task execute];
    return task;
}



- (NSMutableURLRequest *)delete
{
    return [self requestWithMethod:@"DELETE"
                              body:nil
                           headers:nil];
}

- (MSURLSessionDataTask *)deleteWithCompletion:(void(^)(NSError *error))completionHandler
{
    MSURLSessionDataTask *task = [self taskWithRequest:[self delete] completion:^(NSDictionary *response, NSError *error){
                                                                    completionHandler(error);
                                                                 }];
    [task execute];
    return task;
}


@end
