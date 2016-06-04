// Copyright (c) Microsoft Corporation.  All Rights Reserved.  Licensed under the MIT License.  See License in the project root for license information.

#import "MSGraphClientConfiguration.h"

/**
 ## Default Configuration
 
 The shared app configuration uses the following provided:
 
  1.  MSServiceInfoProvider as the serviceInfoProvider to discover the correct Authentication Provider to use
  2.  MSURLSessionManager as the httpProvider
  3.  MSAccountStore as the persistent accountStore
  4.  MSLogger as the logger for the client (with Error Log level)

 @see MSServiceInfoProvider
 @see MSURLSessionManager
 @see MSAccountStore
 @see MSLogger
 
  All of these values are settable via [MSGraphClientConfiguration defaultConfiguration].`<propName>` = provider;
 */

@interface MSGraphClientConfiguration (DefaultConfiguration)

/**
    Gets the default configuration for the app.
 */
+ (instancetype)defaultConfiguration;

@end
