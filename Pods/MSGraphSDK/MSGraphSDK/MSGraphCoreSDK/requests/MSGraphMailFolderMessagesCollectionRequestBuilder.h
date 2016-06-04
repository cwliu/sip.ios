// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphMailFolderMessagesCollectionRequest, MSGraphMessageRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphMailFolderMessagesCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphMailFolderMessagesCollectionRequest *)request;

- (MSGraphMailFolderMessagesCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphMessageRequestBuilder *)message:(NSString *)message;


@end
