

// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphUserWithReferenceRequest;


#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

#import "MSGraphUserReferenceRequestBuilder.h"

@interface MSGraphUserWithReferenceRequestBuilder : MSRequestBuilder


- (MSGraphUserWithReferenceRequest *) request;

- (MSGraphUserWithReferenceRequest *) requestWithOptions:(NSArray *)options;

- (MSGraphUserReferenceRequestBuilder *) reference;

@end
