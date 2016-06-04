// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphContactFolderRequest, MSGraphContactRequestBuilder, MSGraphContactFolderContactsCollectionRequestBuilder, MSGraphContactFolderRequestBuilder, MSGraphContactFolderChildFoldersCollectionRequestBuilder;


#import "MSGraphModels.h"
#import "MSGraphEntityRequestBuilder.h"


@interface MSGraphContactFolderRequestBuilder : MSGraphEntityRequestBuilder

- (MSGraphContactFolderContactsCollectionRequestBuilder *)contacts;

- (MSGraphContactRequestBuilder *)contacts:(NSString *)contact;

- (MSGraphContactFolderChildFoldersCollectionRequestBuilder *)childFolders;

- (MSGraphContactFolderRequestBuilder *)childFolders:(NSString *)contactFolder;


- (MSGraphContactFolderRequest *) request;

- (MSGraphContactFolderRequest *) requestWithOptions:(NSArray *)options;


@end
