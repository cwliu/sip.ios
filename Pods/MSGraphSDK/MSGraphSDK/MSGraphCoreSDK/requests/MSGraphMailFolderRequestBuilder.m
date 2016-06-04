// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"

@implementation MSGraphMailFolderRequestBuilder

- (MSGraphMailFolderMessagesCollectionRequestBuilder *)messages
{
    return [[MSGraphMailFolderMessagesCollectionRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"messages"]  
                                                                           client:self.client];
}

- (MSGraphMessageRequestBuilder *)messages:(NSString *)message
{
    return [[self messages] message:message];
}

- (MSGraphMailFolderChildFoldersCollectionRequestBuilder *)childFolders
{
    return [[MSGraphMailFolderChildFoldersCollectionRequestBuilder alloc] initWithURL:[self.requestURL URLByAppendingPathComponent:@"childFolders"]  
                                                                               client:self.client];
}

- (MSGraphMailFolderRequestBuilder *)childFolders:(NSString *)mailFolder
{
    return [[self childFolders] mailFolder:mailFolder];
}

- (MSGraphMailFolderCopyRequestBuilder *)copyWithDestinationId:(NSString *)destinationId 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.copy"];
    return [[MSGraphMailFolderCopyRequestBuilder alloc] initWithDestinationId:destinationId
                                                                          URL:actionURL
                                                                       client:self.client];


}

- (MSGraphMailFolderMoveRequestBuilder *)moveWithDestinationId:(NSString *)destinationId 
{
    NSURL *actionURL = [self.requestURL URLByAppendingPathComponent:@"microsoft.graph.move"];
    return [[MSGraphMailFolderMoveRequestBuilder alloc] initWithDestinationId:destinationId
                                                                          URL:actionURL
                                                                       client:self.client];


}


- (MSGraphMailFolderRequest *)request
{
    return [self requestWithOptions:nil];
}

- (MSGraphMailFolderRequest *) requestWithOptions:(NSArray *)options
{
    return [[MSGraphMailFolderRequest alloc] initWithURL:self.requestURL options:options client:self.client];
}


@end
