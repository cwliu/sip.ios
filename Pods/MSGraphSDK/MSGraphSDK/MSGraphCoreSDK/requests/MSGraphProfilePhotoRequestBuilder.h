// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphProfilePhotoRequest;


#import "MSGraphModels.h"
#import "MSGraphEntityRequestBuilder.h"


@interface MSGraphProfilePhotoRequestBuilder : MSGraphEntityRequestBuilder


- (MSGraphProfilePhotoRequest *) request;

- (MSGraphProfilePhotoRequest *) requestWithOptions:(NSArray *)options;


@end
