// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSCollection.h"
#import "MSURLSessionDataTask.h"

@interface MSCollectionRequest()

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      body:(NSData *)body
                                   headers:(NSDictionary *)headers;
@end

@implementation MSGraphContactFolderContactsCollectionRequest

- (NSMutableURLRequest *)get
{
    return [self requestWithMethod:@"GET"
                              body:nil
                           headers:nil];
}

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphContactFolderContactsCollectionCompletionHandler)completionHandler
{

    MSURLSessionDataTask * task = [self collectionTaskWithRequest:[self get]
                                             odObjectWithDictionary:^(id response){
                                            return [[MSGraphContact alloc] initWithDictionary:response];
                                         }
                                                        completion:^(MSCollection *collectionResponse, NSError *error){
                                            if(!error && collectionResponse.nextLink && completionHandler){
                                                MSGraphContactFolderContactsCollectionRequest *nextRequest = [[MSGraphContactFolderContactsCollectionRequest alloc] initWithURL:collectionResponse.nextLink options:nil client:self.client];
                                                completionHandler(collectionResponse, nextRequest, nil);
                                            }
                                            else if(completionHandler){
                                                completionHandler(collectionResponse, nil, error);
                                            }
                                        }];
    [task execute];
    return task;
}



- (NSMutableURLRequest *)addContact:(MSGraphContact*)contact
{
    NSData *body = [NSJSONSerialization dataWithJSONObject:[contact dictionaryFromItem]
                                                   options:0
                                                     error:nil];
    return [self requestWithMethod:@"POST"
                              body:body
                           headers:nil];

}

- (MSURLSessionDataTask *)addContact:(MSGraphContact*)contact withCompletion:(MSGraphContactCompletionHandler)completionHandler
{
    MSURLSessionDataTask *task = [self taskWithRequest:[self addContact:contact]
							     odObjectWithDictionary:^(NSDictionary *response){
                                            return [[MSGraphContact alloc] initWithDictionary:response];
                                        }
                                              completion:completionHandler];
    [task execute];
    return task;
}



@end
