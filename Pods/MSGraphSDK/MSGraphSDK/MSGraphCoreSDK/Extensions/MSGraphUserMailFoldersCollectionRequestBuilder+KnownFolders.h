// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import <Foundation/Foundation.h>

#import "MSGraphUserMailFoldersCollectionRequestBuilder.h"

@interface MSGraphUserMailFoldersCollectionRequestBuilder (KnownFolders)

- (MSGraphMailFolderRequestBuilder *)inbox;
- (MSGraphMailFolderRequestBuilder *)drafts;
- (MSGraphMailFolderRequestBuilder *)sentItems;
- (MSGraphMailFolderRequestBuilder *)deletedItems;

@end
