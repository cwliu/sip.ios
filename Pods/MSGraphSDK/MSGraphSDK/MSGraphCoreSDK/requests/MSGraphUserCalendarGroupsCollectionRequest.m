// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSCollection.h"
#import "MSURLSessionDataTask.h"

@interface MSCollectionRequest()

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      body:(NSData *)body
                                   headers:(NSDictionary *)headers;
@end

@implementation MSGraphUserCalendarGroupsCollectionRequest

- (NSMutableURLRequest *)get
{
    return [self requestWithMethod:@"GET"
                              body:nil
                           headers:nil];
}

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphUserCalendarGroupsCollectionCompletionHandler)completionHandler
{

    MSURLSessionDataTask * task = [self collectionTaskWithRequest:[self get]
                                             odObjectWithDictionary:^(id response){
                                            return [[MSGraphCalendarGroup alloc] initWithDictionary:response];
                                         }
                                                        completion:^(MSCollection *collectionResponse, NSError *error){
                                            if(!error && collectionResponse.nextLink && completionHandler){
                                                MSGraphUserCalendarGroupsCollectionRequest *nextRequest = [[MSGraphUserCalendarGroupsCollectionRequest alloc] initWithURL:collectionResponse.nextLink options:nil client:self.client];
                                                completionHandler(collectionResponse, nextRequest, nil);
                                            }
                                            else if(completionHandler){
                                                completionHandler(collectionResponse, nil, error);
                                            }
                                        }];
    [task execute];
    return task;
}



- (NSMutableURLRequest *)addCalendarGroup:(MSGraphCalendarGroup*)calendarGroup
{
    NSData *body = [NSJSONSerialization dataWithJSONObject:[calendarGroup dictionaryFromItem]
                                                   options:0
                                                     error:nil];
    return [self requestWithMethod:@"POST"
                              body:body
                           headers:nil];

}

- (MSURLSessionDataTask *)addCalendarGroup:(MSGraphCalendarGroup*)calendarGroup withCompletion:(MSGraphCalendarGroupCompletionHandler)completionHandler
{
    MSURLSessionDataTask *task = [self taskWithRequest:[self addCalendarGroup:calendarGroup]
							     odObjectWithDictionary:^(NSDictionary *response){
                                            return [[MSGraphCalendarGroup alloc] initWithDictionary:response];
                                        }
                                              completion:completionHandler];
    [task execute];
    return task;
}



@end
