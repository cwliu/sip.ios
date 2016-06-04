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

@interface MSGraphUserSendMailRequest()


@property (nonatomic, getter=message) MSGraphMessage * message;


@property (nonatomic, getter=saveToSentItems) BOOL  saveToSentItems;

@end

@implementation MSGraphUserSendMailRequest


- (instancetype)initWithMessage:(MSGraphMessage *)message saveToSentItems:(BOOL)saveToSentItems URL:(NSURL *)url options:(NSArray *)options client:(ODataBaseClient*)client
{
    NSParameterAssert(message);
    self = [super initWithURL:url options:options client:client];
    if (self){
        _message = message;
        _saveToSentItems = saveToSentItems;
    }
    return self;
}

- (NSMutableURLRequest *)mutableRequest
{
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:[MSObject getNSJsonSerializationCompatibleValue:_message],@"Message",[MSObject getNSJsonSerializationCompatibleValue:@(_saveToSentItems)],@"SaveToSentItems",nil];


    NSData *body = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    return [self requestWithMethod:@"POST" body:body headers:nil];
}


- (MSURLSessionDataTask *)executeWithCompletion:(void (^)(NSDictionary *response, NSError *error))completionHandler
{

    MSURLSessionDataTask *task = [self taskWithRequest:self.mutableRequest
                                odObjectWithDictionary:^(id responseObject){
                                                           return [[NSDictionary alloc] initWithDictionary:responseObject];
                                                       }
                                            completion:completionHandler];
    [task execute];
    return task;
}

@end
