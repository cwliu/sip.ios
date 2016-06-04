

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphDirectoryObjectWithReferenceRequest;


#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

#import "MSGraphDirectoryObjectReferenceRequestBuilder.h"

@interface MSGraphDirectoryObjectWithReferenceRequestBuilder : MSRequestBuilder


- (MSGraphDirectoryObjectWithReferenceRequest *) request;

- (MSGraphDirectoryObjectWithReferenceRequest *) requestWithOptions:(NSArray *)options;

- (MSGraphDirectoryObjectReferenceRequestBuilder *) reference;

@end
