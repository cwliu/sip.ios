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

@interface MSGraphDriveItemCopyRequest()


@property (nonatomic, getter=name) NSString * name;


@property (nonatomic, getter=parentReference) MSGraphItemReference * parentReference;

@end

@implementation MSGraphDriveItemCopyRequest


- (instancetype)initWithName:(NSString *)name parentReference:(MSGraphItemReference *)parentReference URL:(NSURL *)url options:(NSArray *)options client:(ODataBaseClient*)client
{
    self = [super initWithURL:url options:options client:client];
    if (self){
        _name = name;
        _parentReference = parentReference;
    }
    return self;
}

- (NSMutableURLRequest *)mutableRequest
{
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:[MSObject getNSJsonSerializationCompatibleValue:_name],@"name",[MSObject getNSJsonSerializationCompatibleValue:_parentReference],@"parentReference",nil];


    NSData *body = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    return [self requestWithMethod:@"POST" body:body headers:nil];
}


- (MSURLSessionDataTask *)executeWithCompletion:(void (^)(MSGraphDriveItem *response, NSError *error))completionHandler
{

    MSURLSessionDataTask *task = [self taskWithRequest:self.mutableRequest
                                odObjectWithDictionary:^(id responseObject){
                                                           return [[MSGraphDriveItem alloc] initWithDictionary:responseObject];
                                                       }
                                            completion:completionHandler];
    [task execute];
    return task;
}

@end
