// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSQueryParameters.h"

@interface MSOrderByOptions : MSQueryParameters

+ (instancetype) orderBy:(NSString *)orderBy;

@end
