// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSGraphDriveItemRequestBuilder.h"

@interface MSGraphDriveItemRequestBuilder (ItemByPath)

- (MSGraphDriveItemRequestBuilder *)itemByPath:(NSString *)path;

@end
