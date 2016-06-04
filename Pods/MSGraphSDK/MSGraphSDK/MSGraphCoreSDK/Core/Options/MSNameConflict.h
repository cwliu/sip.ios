// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSQueryParameters.h"

@interface MSNameConflict : MSQueryParameters

+ (instancetype)fail;

+ (instancetype)replace;

+ (instancetype)rename;

@end
