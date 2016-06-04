// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.



#import "MSGraphODataEntities.h"
#import "MSGraphModels.h"
#import "MSRequestBuilder.h"

@class MSGraphUserChangePasswordRequest;

@interface MSGraphUserChangePasswordRequestBuilder : MSRequestBuilder

- (instancetype)initWithCurrentPassword:(NSString *)currentPassword newPassword:(NSString *)newPassword URL:(NSURL *)url client:(ODataBaseClient*)client;

- (MSGraphUserChangePasswordRequest *)request;

- (MSGraphUserChangePasswordRequest *)requestWithOptions:(NSArray *)options;

@end
