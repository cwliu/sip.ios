// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSGraphUserMailFoldersCollectionRequestBuilder+KnownFolders.h"
#import "MSGraphMailFolderRequestBuilder.h"

@implementation MSGraphUserMailFoldersCollectionRequestBuilder (KnownFolders)

- (MSGraphMailFolderRequestBuilder *)inbox {
    return [self mailFolder:@"inbox"];
}
- (MSGraphMailFolderRequestBuilder *)drafts {
    return [self mailFolder:@"drafts"];
}
- (MSGraphMailFolderRequestBuilder *)sentItems {
    return [self mailFolder:@"sentItems"];
}
- (MSGraphMailFolderRequestBuilder *)deletedItems {
    return [self mailFolder:@"deletedItems"];
}

@end
