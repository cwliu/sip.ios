// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSRequestBuilder.h"

@class MSCollection;

typedef void (^MSCollectionCompletionHandler)(MSCollection *response, NSError *error);

@interface MSCollectionRequestBuilder : MSRequestBuilder


@end
