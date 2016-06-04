// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSRequest.h"
#import "MSHeaderOptions.h"
#import "MSURLSessionDataTask.h"
#import "MSURLSessionUploadTask.h"
#import "ODataBaseClient.h"
#import "MSConstants.h"
#import "MSGraphSdkVersion.h"

@interface MSRequest()

@property NSMutableArray *options;

@end


@implementation MSRequest

- (instancetype) select:(NSString *)select
{
    [self.options addObject:[MSSelectOptions select:select]];
    return self;
}

- (instancetype) expand:(NSString *)expand
{
    [self.options addObject:[MSExpandOptions expand:expand]];
    return self;
}

- (instancetype) orderBy:(NSString *)orderBy
{
    [self.options addObject:[MSOrderByOptions orderBy:orderBy]];
    return self;
}

- (instancetype) top:(NSInteger)top
{
    [self.options addObject:[MSTopOptions top:top]];
    return self;
}

- (instancetype) ifMatch:(NSString *)ifMatch
{
    [self.options addObject:[MSIfMatch entityTags:ifMatch]];
    return self;
}

- (instancetype) ifNoneMatch:(NSString *)ifNoneMatch
{
    [self.options addObject:[MSIfNoneMatch entityTags:ifNoneMatch]];
    return self;
}

- (instancetype) nameConflict:(MSNameConflict *)nameConflict
{
    [self.options addObject:nameConflict];
    return self;
}

- (instancetype)initWithURL:(NSURL *)url client:(ODataBaseClient *)client
{
    return [self initWithURL:url options:nil client:client];
}

- (instancetype) initWithURL:(NSURL *)url options:(NSArray *)options client:(ODataBaseClient *)client
{
    NSParameterAssert(url);
    NSParameterAssert(client);
    
    [client.logger logWithLevel:MSLogLevelLogDebug message:@" MSRequest init with URL : %@ options : %@", url, options];
    self = [super init];
    if (self){
        // It may be best to make this an options object so it is type safe
        if (options){
            [options enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop){
                if (![obj isKindOfClass:[MSRequestOptions class]]){
                    [client.logger logWithLevel:MSLogLevelLogError message:@" Option : %@ are not MSRequestOptions", obj];
                    NSAssert([obj isKindOfClass:[MSRequestOptions class]], @"Options must be of type MSRequestOptions");
                }
            }];
        }
        _options = [options mutableCopy];
        if (!_options){
            _options = [NSMutableArray array];
        }
        _requestURL =  url;
        _client = client;
    }
    return self;
}

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      body:(NSData *)body
                                   headers:(NSDictionary *)headers
{
    NSParameterAssert(method);
    
    [self.client.logger logWithLevel:MSLogLevelLogVerbose message:@" Creating Request with method : %@ body : %@ headers : %@", method, body, headers];
    
    MSRequestOptionsBuilder *optionsBuilder = [MSRequestOptionsBuilder optionsWithArray:self.options];
    NSURL *url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@%@",[self.requestURL absoluteString], optionsBuilder.functionParams, optionsBuilder.queryOptions]];
   
    [self.client.logger logWithLevel:MSLogLevelLogDebug message:@"Request url : %@", url];
    
    // Apple tries to be smart but they are using the wrong eTag when making requests...
    // so we must disable the caching policy
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url
                                                           cachePolicy:NSURLRequestReloadIgnoringCacheData
                                                       timeoutInterval:60];
    request.HTTPMethod = method;

    if (body){
        request.HTTPBody = body;
    }
    if (headers && [headers count] > 0){
        [headers enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL*stop){
            [request setValue:value forHTTPHeaderField:key];
        }];
    }
    [optionsBuilder.headers enumerateKeysAndObjectsUsingBlock:^(id key, id value, BOOL *stop){
        [request setValue:value forHTTPHeaderField:key];
    }];
    
    [request setValue:[NSString stringWithFormat:@"%@%@", MSGraphSdkVersionHeaderPrefix, MSGraphSdkVersion] forHTTPHeaderField:MSHeaderSdkVersion];
    
    return request;
}

- (MSURLSessionDataTask *)taskWithRequest:(NSMutableURLRequest *)request
                   odObjectWithDictionary:(MSObjectWithDictionary)castBlock
                               completion:(MSObjectCompletionHandler)completionHandler
{
    NSParameterAssert(request);
    
    [self.client.logger logWithLevel:MSLogLevelLogVerbose message:@"Creating Data task with request : %@", request];
    
    return [self taskWithRequest:request completion:^(NSDictionary *rawResponse, NSError *error){
        if (!error){
            if (completionHandler && castBlock){
                id parsedObject = castBlock(rawResponse);
                completionHandler(parsedObject, nil);
            }
        }
        else {
            [self.client.logger logWithLevel:MSLogLevelLogError message:@"Error from data task : %@", error];
            [self.client.logger logWithLevel:MSLogLevelLogError message:@"Caused by request %@", request];
            if(completionHandler){
                completionHandler(nil, error);
            }
        }
    }];
}

- (MSAsyncURLSessionDataTask *)asyncTaskWithRequest:(NSMutableURLRequest *)request
                             odObjectWithDictionary:(MSObjectWithDictionary)castBlock
                                        completion:(MSAsyncActionCompletion)completionHandler
{
    NSParameterAssert(request);
    
    MSAsyncActionCompletion asyncCompletion = nil;
    [self.client.logger logWithLevel:MSLogLevelLogVerbose message:@"Creating Async task with request : %@", request];
    if (completionHandler){
        asyncCompletion = ^(NSDictionary *response, MSAsyncOperationStatus *status, NSError *error){
            if (!error){
                // if we have the completionHandler and cast blocks as well as no status
                if (completionHandler && castBlock){
                    id parsedObject = nil;
                    if (!status){
                        parsedObject = castBlock(response);
                    }
                    completionHandler(parsedObject, status, error);
                }
            }
            else {
                [self.client.logger logWithLevel:MSLogLevelLogError message:@"Error from async task : %@", error];
                [self.client.logger logWithLevel:MSLogLevelLogDebug message:@"Caused by request %@", request];
                if(completionHandler){
                    completionHandler(nil, status, error);
                }
            }
        };
    }
    return [self asyncTaskWithRequest:request completion:asyncCompletion];
}

- (MSURLSessionUploadTask *)uploadTaskWithRequest:(NSMutableURLRequest *)request
                                         fromFile:(NSURL *)fileURL
                           odobjectWithDictionary:(MSObjectWithDictionary)castBlock
                                completionHandler:(MSObjectCompletionHandler)completionHandler
{
    [self.client.logger logWithLevel:MSLogLevelLogVerbose message:@"Creating upload task with requests : %@", request];
    return [[MSURLSessionUploadTask alloc] initWithRequest:request
                                                  fromFile:fileURL
                                                    client:self.client
                                         completionHandler:^(NSDictionary *response, NSError *error){
                                             [self onUploadCompletion:response
                                                                error:error
                                                odObjectWithDictionar:castBlock
                                                    completionHandler:completionHandler];
    }];
}

- (MSURLSessionUploadTask *)uploadTaskWithRequest:(NSMutableURLRequest *)request
                                         fromData:(NSData *)data
                           odobjectWithDictionary:(MSObjectWithDictionary)castBlock
                                completionHandler:(MSObjectCompletionHandler)completionHandler
{
     [self.client.logger logWithLevel:MSLogLevelLogVerbose message:@"Creating upload task with requests : %@", request];
    return [[MSURLSessionUploadTask alloc] initWithRequest:request
                                                    data:data
                                                    client:self.client
                                         completionHandler:^(NSDictionary *response, NSError *error){
                                             [self onUploadCompletion:response
                                                                error:error
                                                odObjectWithDictionar:castBlock
                                                    completionHandler:completionHandler];
    }]; 
}

- (void)onUploadCompletion:(NSDictionary *)response
                     error:(NSError *)error
     odObjectWithDictionar:(MSObjectWithDictionary)castBlock
         completionHandler:(MSObjectCompletionHandler)completionHandler
{
    if (completionHandler){
    id parsedObject = nil;
        if (!error && castBlock){
            parsedObject = castBlock(response);
        }
        completionHandler(parsedObject, error);
    }
}

- (MSAsyncURLSessionDataTask *)asyncTaskWithRequest:(NSMutableURLRequest *)request
                                         completion:(MSAsyncActionCompletion)completionHandler
{
    NSParameterAssert(request);
    
    return [[MSAsyncURLSessionDataTask alloc] initWithRequest:request client:self.client completion:completionHandler];
}

- (MSURLSessionDataTask *)taskWithRequest:(NSMutableURLRequest *)request
                               completion:(void (^)(NSDictionary *dictionary, NSError *error))completionHandler
{
    NSParameterAssert(request);
    
    return [[MSURLSessionDataTask alloc] initWithRequest:request client:self.client completion:completionHandler];
    
}

@end
