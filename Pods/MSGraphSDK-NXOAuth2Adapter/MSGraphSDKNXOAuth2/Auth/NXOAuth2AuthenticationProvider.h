//  Copyright 2015 Microsoft Corporation
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

#import <Foundation/Foundation.h>

#import "MSAuthenticationProvider.h"

@interface NXOAuth2AuthenticationProvider : NSObject <MSAuthenticationProvider>

@property (nonatomic, strong, readonly) NSString *clientId;
@property (nonatomic, strong, readonly) NSArray *scopes;

// These properties should not need changing from their default values
//  but are exposed in case they are needed for debugging etc.
@property (nonatomic, strong) NSString *authorizationURL;
@property (nonatomic, strong) NSString *tokenURL;
@property (nonatomic, strong) NSString *redirectURL;
@property (nonatomic, strong) NSString *tokenType;

/**
 Get the default singleton instance of OAuth2AuthenticationProvider
 */
+ (NXOAuth2AuthenticationProvider*)sharedAuthProvider;

/**
 Set the shared auth provider to use the given OAuth 2.0 clientId and scopes
 @param clientId Client/Application ID as registered on apps.dev.microsoft.com
 @param scopes OAuth 2.0 scopes to request
 */
+ (void)setClientId:(NSString*)clientId scopes:(NSArray*)scopes;

/**
 Set this auth provider to use the given OAuth 2.0 clientId and scopes
 @param clientId Client/Application ID as registered on apps.dev.microsoft.com
 @param scopes OAuth 2.0 scopes to request
 */
- (void)setClientId:(NSString*)clientId scopes:(NSArray*)scopes;

/**
 Obtains access token by performing login with UI, where viewController specifies the parent view controller.
 @param viewController The view controller to present the UI on.
 @param completionHandler The completion handler to be called when the authentication has completed.
 error should be non nil if there was no error, and should contain any error(s) that occurred.
 */
- (void) loginWithViewController:(UIViewController*)viewController completion:(void (^)(NSError *error))completionHandler;

/**
 Attempts to obtain the last used Account, returning YES for success and NO for failure.
 */
- (BOOL) loginSilent;

/**
 Signs out the current AuthProvider, completely removing all tokens and cookies.
 @param completionHandler The completion handler to be called when sign out has completed.
 error should be non nil if there was no error, and should contain any error(s) that occurred.
 */
- (void) logout;

/**
 MSAuthProvider implementation. Adds appropriate auth header to a NSMutableURLRequest, refreshing access token if necessary. Must have previously obtained an access token via one of the login methods before calling.
 @param request The request to add the auth header to
 @param completionHandler The completion handler to be called when the auth header has been appended. This may not occur synchronously if the access token needs to be refreshed first.
 */
- (void)appendAuthenticationHeaders:(NSMutableURLRequest *)request completion:(MSAuthenticationCompletion)completionHandler;

@end
