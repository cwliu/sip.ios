// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import <Foundation/Foundation.h>
#import "MSHttpProvider.h"
#import "MSAuthenticationProvider.h"
#import "MSLoggerProtocol.h"

/**
 Configuration for the application.
 All app information should match the information in your app portal with Microsoft Accounts or Azure Active Directory.
 */
@interface MSGraphClientConfiguration : NSObject

/**
 The httpProvider to be used for all network requests.
 @warning This must not be nil.
 */
@property (strong, nonatomic) id <MSHttpProvider> httpProvider;

/**
 The Authentication Provider to be used.
 @warning This may be nil, and if it is, there must be an MSServiceInfoProvider to discover the correct authentication provider to use.
 @see serviceInfoProvider.
 */
@property (strong, nonatomic) id <MSAuthenticationProvider> authenticationProvider;

/**
 The logger to be used in the MSGraphClient.
 */
@property (strong, nonatomic) id <MSLogger> logger;

@property (strong, nonatomic) NSString *apiEndpoint;

@end

