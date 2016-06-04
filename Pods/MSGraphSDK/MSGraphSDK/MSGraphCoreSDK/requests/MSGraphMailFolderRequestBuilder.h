// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphMailFolderRequest, MSGraphMessageRequestBuilder, MSGraphMailFolderMessagesCollectionRequestBuilder, MSGraphMailFolderRequestBuilder, MSGraphMailFolderChildFoldersCollectionRequestBuilder, MSGraphMailFolderCopyRequestBuilder, MSGraphMailFolderMoveRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphEntityRequestBuilder.h"


@interface MSGraphMailFolderRequestBuilder : MSGraphEntityRequestBuilder

- (MSGraphMailFolderMessagesCollectionRequestBuilder *)messages;

- (MSGraphMessageRequestBuilder *)messages:(NSString *)message;

- (MSGraphMailFolderChildFoldersCollectionRequestBuilder *)childFolders;

- (MSGraphMailFolderRequestBuilder *)childFolders:(NSString *)mailFolder;

- (MSGraphMailFolderCopyRequestBuilder *)copyWithDestinationId:(NSString *)destinationId ;



- (MSGraphMailFolderMoveRequestBuilder *)moveWithDestinationId:(NSString *)destinationId ;




- (MSGraphMailFolderRequest *) request;

- (MSGraphMailFolderRequest *) requestWithOptions:(NSArray *)options;


@end
