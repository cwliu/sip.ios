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

@interface MSGraphUserAssignLicenseRequest()


@property (nonatomic, getter=addLicenses) NSArray * addLicenses;


@property (nonatomic, getter=removeLicenses) NSArray * removeLicenses;

@end

@implementation MSGraphUserAssignLicenseRequest


- (instancetype)initWithAddLicenses:(NSArray *)addLicenses removeLicenses:(NSArray *)removeLicenses URL:(NSURL *)url options:(NSArray *)options client:(ODataBaseClient*)client
{
    NSParameterAssert(addLicenses);
    NSParameterAssert(removeLicenses);
    self = [super initWithURL:url options:options client:client];
    if (self){
        _addLicenses = addLicenses;
        _removeLicenses = removeLicenses;
    }
    return self;
}

- (NSMutableURLRequest *)mutableRequest
{
    NSDictionary *params = [[NSDictionary alloc] initWithObjectsAndKeys:[MSObject getNSJsonSerializationCompatibleValue:_addLicenses],@"addLicenses",[MSObject getNSJsonSerializationCompatibleValue:_removeLicenses],@"removeLicenses",nil];


    NSData *body = [NSJSONSerialization dataWithJSONObject:params options:0 error:nil];
    return [self requestWithMethod:@"POST" body:body headers:nil];
}


- (MSURLSessionDataTask *)executeWithCompletion:(void (^)(MSGraphUser *response, NSError *error))completionHandler
{

    MSURLSessionDataTask *task = [self taskWithRequest:self.mutableRequest
                                odObjectWithDictionary:^(id responseObject){
                                                           return [[MSGraphUser alloc] initWithDictionary:responseObject];
                                                       }
                                            completion:completionHandler];
    [task execute];
    return task;
}

@end
