// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import <Foundation/Foundation.h>

#import "MSQueryParameters.h"
#import "MSHeaderOptions.h"
#import "MSExpandOptions.h"
#import "MSSelectOptions.h"
#import "MSIfMatch.h"
#import "MSIfNoneMatch.h"
#import "MSTopOptions.h"
#import "MSOrderByOptions.h"
#import "MSNameConflict.h"

@interface MSRequestOptionsBuilder : NSObject

@property (strong, readonly) NSString *queryOptions;
@property (strong, readonly) NSString *functionParams;
@property (strong, readonly) NSDictionary *headers;

+ (instancetype)optionsWithArray:(NSArray *)options;

@end
