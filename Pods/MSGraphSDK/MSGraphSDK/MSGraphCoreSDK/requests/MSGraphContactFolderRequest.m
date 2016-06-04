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

@implementation MSGraphContactFolderRequest


- (NSMutableURLRequest *)get
{
    return [self requestWithMethod:@"GET"
                              body:nil
                           headers:nil];
}

- (MSURLSessionDataTask *)getWithCompletion:(void (^)(MSGraphContactFolder *response, NSError *error))completionHandler
{
    MSURLSessionDataTask *task = [self taskWithRequest:[self get]
                                odObjectWithDictionary:^(NSDictionary *response){
                                            return [[MSGraphContactFolder alloc] initWithDictionary:response];
                                        }
                                             completion:completionHandler];
    [task execute];
    return task;
}



- (NSMutableURLRequest *)update:(MSGraphContactFolder *)contactFolder
{
    NSData *body = [NSJSONSerialization dataWithJSONObject:[contactFolder dictionaryFromItem] options:0 error:nil];
    return [self requestWithMethod:@"PATCH"
                              body:body
                           headers:nil];
}

- (MSURLSessionDataTask *)update:(MSGraphContactFolder *)contactFolder withCompletion:(void (^)(MSGraphContactFolder *response, NSError *error))completionHandler
{
    MSURLSessionDataTask *task = [self taskWithRequest:[self update:contactFolder]
                                odObjectWithDictionary:^(NSDictionary *response){
                                            return [[MSGraphContactFolder alloc] initWithDictionary:response];
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
