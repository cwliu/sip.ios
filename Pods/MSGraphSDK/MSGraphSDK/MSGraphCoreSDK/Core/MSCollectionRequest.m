// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSCollectionRequest.h"
#import "MSCollection.h"
#import "ODataBaseClient.h"
#import "MSConstants.h"

@implementation MSCollectionRequest

- (MSURLSessionDataTask *)collectionTaskWithRequest:(NSMutableURLRequest *)request
                             odObjectWithDictionary:(MSObject* (^)(NSDictionary *response))castBlock
                                         completion:(void (^)(MSCollection *response, NSError *error))completionHandler
{
    return [self taskWithRequest:request
          odObjectWithDictionary: ^MSCollection *(NSDictionary *rawResponse){
                           NSMutableArray *odObjects = [NSMutableArray array];
                           __block MSCollection *parsedCollection = nil;
                           if (rawResponse[MSCollectionValueKey]){
                               [rawResponse[MSCollectionValueKey] enumerateObjectsUsingBlock:^(id obj, NSUInteger index, BOOL *stop){
                                   id value = castBlock(obj);
                                   if (value){
                                       [odObjects addObject:value];
                                   }
                                   else{
                                       // There was a failure in parsing the item
                                       [self.client.logger logWithLevel:MSLogLevelLogError message:@"Failed to parse collection"];
                                       [self.client.logger logWithLevel:MSLogLevelLogDebug message:@"Object failed  to parse : %@", obj];
                                       *stop = YES;
                                   }
                               }];
                               // if we were able to parse all of the items in the collection
                               if ([odObjects count] == [rawResponse[MSCollectionValueKey] count]){
                                   parsedCollection = [[MSCollection alloc] initWithArray:odObjects
                                                                                 nextLink:rawResponse[MSODataNextContext]
                                                                           additionalData:rawResponse];
                               }
                               else{
                                   [self.client.logger logWithLevel:MSLogLevelLogDebug message:@"Failed to parse collection objects expected %ld there were %ld", [rawResponse[MSCollectionValueKey] count], [odObjects count]];
                               }
                               
                           }
                           else{
                               [self.client.logger logWithLevel:MSLogLevelLogError message:@"Collection contains no value property"];
                               [self.client.logger logWithLevel:MSLogLevelLogDebug message:@"Response was : %@", rawResponse];
                           }
                            return parsedCollection;
                       }
                       completion:completionHandler];
}
@end
