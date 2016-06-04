

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDirectoryObjectReferenceRequest;


#import "MSGraphModels.h"
#import "MSRequestBuilder.h"


@interface MSGraphDirectoryObjectReferenceRequestBuilder : MSRequestBuilder


- (MSGraphDirectoryObjectReferenceRequest *) request;

- (MSGraphDirectoryObjectReferenceRequest *) requestWithOptions:(NSArray *)options;


@end
