// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphUserContactFoldersCollectionRequest, MSGraphContactFolderRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphUserContactFoldersCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphUserContactFoldersCollectionRequest *)request;

- (MSGraphUserContactFoldersCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphContactFolderRequestBuilder *)contactFolder:(NSString *)contactFolder;


@end
