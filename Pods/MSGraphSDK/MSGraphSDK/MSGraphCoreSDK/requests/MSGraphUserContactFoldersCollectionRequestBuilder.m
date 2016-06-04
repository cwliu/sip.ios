// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphUserContactFoldersCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserContactFoldersCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphUserContactFoldersCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphUserContactFoldersCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphContactFolderRequestBuilder *)contactFolder:(NSString *)contactFolder
{
    return [[MSGraphContactFolderRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:contactFolder]
                                                   client:self.client];
}

@end
