// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserMailFoldersCollectionRequest, MSGraphMailFolderRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphUserMailFoldersCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserMailFoldersCollectionRequest *)request;

- (MSGraphUserMailFoldersCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphMailFolderRequestBuilder *)mailFolder:(NSString *)mailFolder;


@end
