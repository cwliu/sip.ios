// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphContactRequest, MSGraphProfilePhotoRequestBuilder, MSGraphPhotoRequestBuilder, MSGraphProfilePhotoStreamRequest;


#import "MSGraphModels.h"
#import "MSGraphOutlookItemRequestBuilder.h"


@interface MSGraphContactRequestBuilder : MSGraphOutlookItemRequestBuilder

- (MSGraphProfilePhotoRequestBuilder *) photo;

- (MSGraphProfilePhotoStreamRequest *) photoValueWithOptions:(NSArray *)options;

- (MSGraphProfilePhotoStreamRequest *) photoValue;


- (MSGraphContactRequest *) request;

- (MSGraphContactRequest *) requestWithOptions:(NSArray *)options;


@end
