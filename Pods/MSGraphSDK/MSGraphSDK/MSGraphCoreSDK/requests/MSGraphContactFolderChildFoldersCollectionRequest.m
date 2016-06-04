// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSCollection.h"
#import "MSURLSessionDataTask.h"

@interface MSCollectionRequest()

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      body:(NSData *)body
                                   headers:(NSDictionary *)headers;
@end

@implementation MSGraphContactFolderChildFoldersCollectionRequest

- (NSMutableURLRequest *)get
{
    return [self requestWithMethod:@"GET"
                              body:nil
                           headers:nil];
}

- (MSURLSessionDataTask *)getWithCompletion:(MSGraphContactFolderChildFoldersCollectionCompletionHandler)completionHandler
{

    MSURLSessionDataTask * task = [self collectionTaskWithRequest:[self get]
                                             odObjectWithDictionary:^(id response){
                                            return [[MSGraphContactFolder alloc] initWithDictionary:response];
                                         }
                                                        completion:^(MSCollection *collectionResponse, NSError *error){
                                            if(!error && collectionResponse.nextLink && completionHandler){
                                                MSGraphContactFolderChildFoldersCollectionRequest *nextRequest = [[MSGraphContactFolderChildFoldersCollectionRequest alloc] initWithURL:collectionResponse.nextLink options:nil client:self.client];
                                                completionHandler(collectionResponse, nextRequest, nil);
                                            }
                                            else if(completionHandler){
                                                completionHandler(collectionResponse, nil, error);
                                            }
                                        }];
    [task execute];
    return task;
}



- (NSMutableURLRequest *)addContactFolder:(MSGraphContactFolder*)contactFolder
{
    NSData *body = [NSJSONSerialization dataWithJSONObject:[contactFolder dictionaryFromItem]
                                                   options:0
                                                     error:nil];
    return [self requestWithMethod:@"POST"
                              body:body
                           headers:nil];

}

- (MSURLSessionDataTask *)addContactFolder:(MSGraphContactFolder*)contactFolder withCompletion:(MSGraphContactFolderCompletionHandler)completionHandler
{
    MSURLSessionDataTask *task = [self taskWithRequest:[self addContactFolder:contactFolder]
							     odObjectWithDictionary:^(NSDictionary *response){
                                            return [[MSGraphContactFolder alloc] initWithDictionary:response];
                                        }
                                              completion:completionHandler];
    [task execute];
    return task;
}



@end
