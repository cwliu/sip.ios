

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSCollection.h"
#import "MSURLSessionDataTask.h"

@interface MSCollectionRequest()

- (NSMutableURLRequest *)requestWithMethod:(NSString *)method
                                      body:(NSData *)body
                                   headers:(NSDictionary *)headers;
@end

@implementation MSGraphUserRegisteredDevicesCollectionReferencesRequest



- (NSMutableURLRequest *)addDirectoryObject:(MSGraphDirectoryObject*)directoryObject
{

    NSData *body = [NSJSONSerialization dataWithJSONObject: [NSDictionary dictionaryWithObjectsAndKeys:
    [NSString stringWithFormat:@"%@/directoryObjects/%@",[[self client] baseURL],directoryObject.entityId]
    ,@"@odata.id",nil]
                                               options:0
                                                 error:nil];
    return [self requestWithMethod:@"POST"
                              body:body
                           headers:nil];

}

- (MSURLSessionDataTask *)addDirectoryObject:(MSGraphDirectoryObject*)directoryObject withCompletion:(MSGraphDirectoryObjectCompletionHandler)completionHandler
{
    MSURLSessionDataTask *task = [self taskWithRequest:[self addDirectoryObject:directoryObject]
							     odObjectWithDictionary:^(NSDictionary *response){
                                            return [[MSGraphDirectoryObject alloc] initWithDictionary:response];
                                        }
                                              completion:completionHandler];
    [task execute];
    return task;
}



@end
