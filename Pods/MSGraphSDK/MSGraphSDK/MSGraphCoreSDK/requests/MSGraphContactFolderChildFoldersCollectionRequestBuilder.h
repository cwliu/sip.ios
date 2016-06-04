// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.


@class MSGraphContactFolderChildFoldersCollectionRequest, MSGraphContactFolderRequestBuilder;

#import "MSGraphModels.h"
#import "MSCollectionRequestBuilder.h"




@interface MSGraphContactFolderChildFoldersCollectionRequestBuilder : MSCollectionRequestBuilder

- (MSGraphContactFolderChildFoldersCollectionRequest *)request;

- (MSGraphContactFolderChildFoldersCollectionRequest *)requestWithOptions:(NSArray *)options;

- (MSGraphContactFolderRequestBuilder *)contactFolder:(NSString *)contactFolder;


@end
