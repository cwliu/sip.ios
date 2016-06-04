// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphMailFolderChildFoldersCollectionRequest, MSGraphMailFolderRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphMailFolderChildFoldersCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphMailFolderChildFoldersCollectionRequest *)request;

- (MSGraphMailFolderChildFoldersCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphMailFolderRequestBuilder *)mailFolder:(NSString *)mailFolder;


@end
