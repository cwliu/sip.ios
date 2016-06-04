// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphMailFolderMessagesCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphMailFolderMessagesCollectionRequest*) request
{
    return [self requestWithOptions:nil];
}

- (MSGraphMailFolderMessagesCollectionRequest *)requestWithOptions:(NSArray *)options
{
    return [[MSGraphMailFolderMessagesCollectionRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}
- (MSGraphMessageRequestBuilder *)message:(NSString *)message
{
    return [[MSGraphMessageRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:message]
                                                   client:self.client];
}

@end
