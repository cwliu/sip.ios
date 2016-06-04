// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.




#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSURLSessionDataTask.h"





@interface MSRequest()

@property NSMutableArray *options;

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      body:(NSData *)body
                                   headers:(NSDictionary *)headers;

@end

@interface MSGraphDriveItemCreateLinkRequest()


@property (nonatomic, getter=type) NSString * type;


@property (nonatomic, getter=scope) NSString * scope;

@end

@implementation MSGraphDriveItemCreateLinkRequest


- (instancetype)initWithType:(NSString *)type scope:(NSString *)scope URL:(NSURL *)url options:(NSArray *)options client:(ODataBaseClient*)client
{
    NSParameterAssert(type);
    self = [super initWithURL:url options:options client:client];
    if (self){
        _type = type;
        _scope = scope;
    }
    return self;
}

- (NSMutableURLRequest *)mutableRequest
{
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:[MSObject getNSJsonSerializationCompatibleValue:_type],@"type",[MSObject getNSJsonSerializationCompatibleValue:_scope],@"scope",nil];


    NSData *body = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    return [self requestWithMethod:@"POST" body:body headers:nil];
}


- (MSURLSessionDataTask *)executeWithCompletion:(void (^)(MSGraphPermission *response, NSError *error))completionHandler
{

    MSURLSessionDataTask *task = [self taskWithRequest:self.mutableRequest
                                odObjectWithDictionary:^(id responseObject){
                                                           return [[MSGraphPermission alloc] initWithDictionary:responseObject];
                                                       }
                                            completion:completionHandler];
    [task execute];
    return task;
}

@end
