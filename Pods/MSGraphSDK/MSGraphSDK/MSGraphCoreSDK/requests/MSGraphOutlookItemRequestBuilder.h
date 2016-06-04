// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



@class MSGraphOutlookItemRequest;


#import "MSGraphModels.h"
#import "MSGraphEntityRequestBuilder.h"


@interface MSGraphOutlookItemRequestBuilder : MSGraphEntityRequestBuilder


- (MSGraphOutlookItemRequest *) request;

- (MSGraphOutlookItemRequest *) requestWithOptions:(NSArray *)options;


@end
