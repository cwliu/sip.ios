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

#import "NXOAuth2AuthenticationProvider.h"

#import "NXOAuth2.h"
#import "MSAuthConstants.h"
#import "MSAuthenticationViewController.h"
#import "MSLogger.h"

static NSString *const lastIdentifierKey = @"com.graph.nxoauth2.lastIdentifierKey";

typedef void (^AuthCompletion)(NSError *error);

@interface NXOAuth2AuthenticationProvider ()

@property (nonatomic, strong) NXOAuth2Account *userAccount;
@property (nonatomic, strong) MSLogger *logger;
@property (nonatomic, copy) AuthCompletion pendingAuthCompletion;  // Used to translate NXOAuth2 observer to completion block
@property (nonatomic, strong, readwrite) NSString *clientId;  // Override to readwrite internally
@property (nonatomic, strong, readwrite) NSArray *scopes;  // Override to readwrite internally
@end


// Nastyhack so we can get a callback when doing a token refresh (async)
@interface NXOAuth2AuthenticatorRefreshCallback : NXOAuth2Connection
@property (nonatomic, copy) void (^completionHandler)();
@end
@implementation NXOAuth2AuthenticatorRefreshCallback

- (id)initWithCompletionHandler:(void (^)())completionHandler {
    if (self = [super init]) {
        _completionHandler = completionHandler;
    }
    return self;
}

// Invoked by NXOAuth2Client when access token is refreshed.
- (void)retry {
    self.completionHandler();
}

@end

@implementation NXOAuth2AuthenticationProvider

#pragma mark - Lifecycle

+ (NXOAuth2AuthenticationProvider*)sharedAuthProvider {
    static NXOAuth2AuthenticationProvider* sharedProvider;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedProvider = [[NXOAuth2AuthenticationProvider alloc] init];
    });
    return sharedProvider;
}

- (id)init {
    if (self = [super init]) {
        // Sensible defaults that cover the 99% use case, overridable as public properties
        _authorizationURL = MS_AADV2_AUTH_URL;
        _tokenURL = MS_AADV2_TOKEN_URL;
        _redirectURL = MS_AADV2_REDIRECT_URL;
        _tokenType = MS_AADV2_TOKEN_TYPE;
        
        _logger = [[MSLogger alloc] initWithLogLevel:MSLogLevelLogError];
        
        // Register for notifications of auth completion/failure
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onAccountStoreAccountsDidChange:)
                                                     name:NXOAuth2AccountStoreAccountsDidChangeNotification
                                                   object:[NXOAuth2AccountStore sharedStore]];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(onAccountStoreAuthFailed:)
                                                     name:NXOAuth2AccountStoreDidFailToRequestAccessNotification
                                                   object:[NXOAuth2AccountStore sharedStore]];
    }
    return self;
}

- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:NXOAuth2AccountStoreAccountsDidChangeNotification
                                                  object:[NXOAuth2AccountStore sharedStore]];
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:NXOAuth2AccountStoreDidFailToRequestAccessNotification
                                                  object:[NXOAuth2AccountStore sharedStore]];
}

#pragma mark - Login Interface

+ (void)setClientId:(NSString *)clientId scopes:(NSArray *)scopes {
    [[NXOAuth2AuthenticationProvider sharedAuthProvider] setClientId:clientId scopes:scopes];
}

- (void)setClientId:(NSString*)clientId scopes:(NSArray*)scopes
{
    NSParameterAssert(clientId);
    NSParameterAssert(scopes);
    self.clientId = [clientId copy];
    
    NSMutableArray *copiedArray = [NSMutableArray arrayWithArray:scopes];
    
    // Ensure 'offline_access' scope is specified, required for token refreshing.
    if (![self.scopes containsObject:@"offline_access"]) {
        [copiedArray addObject:@"offline_access"];
    }
    
    self.scopes = copiedArray;
}

- (void)loginWithViewController:(UIViewController*)viewController
                     completion:(void (^)(NSError *error))completionHandler
{
    if (!viewController) {
        viewController = [[[[UIApplication sharedApplication] delegate] window] rootViewController];
    }
    
    NSURL *tokenURL = [NSURL URLWithString:self.tokenURL];
    [[NXOAuth2AccountStore sharedStore] setClientID:self.clientId
                                             secret:@""
                                              scope:[NSSet setWithArray:self.scopes]
                                   authorizationURL:[NSURL URLWithString:self.authorizationURL]
                                           tokenURL:tokenURL
                                        redirectURL:[NSURL URLWithString:self.redirectURL]
                                      keyChainGroup:[tokenURL host]
                                          tokenType:self.tokenType
                                     forAccountType:@"MSGraph"];
    
    [[NXOAuth2AccountStore sharedStore] requestAccessToAccountWithType:@"MSGraph" withPreparedAuthorizationURLHandler:^(NSURL *preparedURL)
    {
        [self.logger logWithLevel:MSLogLevelLogDebug message:@"Authentication URL : %@", preparedURL];
        
        // Get the view controller on the top of the stack
        UIViewController *presentingViewController = [[viewController childViewControllers] firstObject];
        // if the view controller's child is an ODAuthenticationViewController we just want to redirect to a new URL
        // not push another view controller
        if (presentingViewController && [presentingViewController isKindOfClass:[MSAuthenticationViewController class]]){
            __block MSAuthenticationViewController *authViewController = (MSAuthenticationViewController *)presentingViewController;
            [authViewController redirectWithStartURL:preparedURL
                                              endURL:[NSURL URLWithString:self.redirectURL]
                                             success:^(NSURL *endURL, NSError *error){
                                                 [self authorizationFlowCompletedWithURL:endURL
                                                                                   error:error
                                                                presentingViewController:presentingViewController
                                                                              completion:completionHandler];
                                             }];
        }
        else {
            __block MSAuthenticationViewController *authViewController =
            [[MSAuthenticationViewController alloc] initWithStartURL:preparedURL
                                                              endURL:[NSURL URLWithString:self.redirectURL]
                                                             success:^(NSURL *endURL, NSError *error){
                                                                 [self authorizationFlowCompletedWithURL:endURL
                                                                                                   error:error
                                                                                presentingViewController:authViewController
                                                                                              completion:completionHandler];
                                                                 
                                                             }];
            dispatch_async(dispatch_get_main_queue(), ^{
                UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:authViewController];
                navController.modalPresentationStyle = viewController.modalPresentationStyle;
                UIViewController *viewControllerToPresentOn = viewController;
                while (viewControllerToPresentOn.presentedViewController) {
                    viewControllerToPresentOn = viewControllerToPresentOn.presentedViewController;
                }
                [viewControllerToPresentOn presentViewController:navController animated:YES  completion:^{
                    [authViewController loadInitialRequest];
                }];
            });
        }
    }];
}

- (BOOL)loginSilent {
    NSURL *tokenURL = [NSURL URLWithString:self.tokenURL];
    [[NXOAuth2AccountStore sharedStore] setClientID:self.clientId
                                             secret:@""
                                              scope:[NSSet setWithArray:self.scopes]
                                   authorizationURL:[NSURL URLWithString:self.authorizationURL]
                                           tokenURL:tokenURL
                                        redirectURL:[NSURL URLWithString:self.redirectURL]
                                      keyChainGroup:[tokenURL host]
                                          tokenType:self.tokenType
                                     forAccountType:@"MSGraph"];
    
    NSString *identifier = [self lastSuccessfulLoginIdentifier];
    
    if (identifier) {
        for (NXOAuth2Account *account in [[NXOAuth2AccountStore sharedStore] accounts]) {
            if ([account.identifier isEqualToString:identifier]) {
                self.userAccount = account;
                return YES;
            }
        }
    }
    return NO;
}

- (void)logout {
    [[NXOAuth2AccountStore sharedStore] removeAccount:self.userAccount];
    self.userAccount = nil;
    [self setLastSuccessfulLoginIdentifier:nil];
    
    // Ideally we should make an async request to MS_AADV2_LOGOUT_URL, but that takes
    //   a fair bit of 
    for(NSHTTPCookie *cookie in [[NSHTTPCookieStorage sharedHTTPCookieStorage] cookies]) {
        if([cookie.domain hasSuffix:@"login.microsoftonline.com"] ||
           [cookie.domain hasSuffix:@".live.com"]) {
            [[NSHTTPCookieStorage sharedHTTPCookieStorage] deleteCookie:cookie];
        }
    }
    [[NSUserDefaults standardUserDefaults] synchronize];
}

#pragma mark - MSAuthProvider

- (void)appendAuthenticationHeaders:(NSMutableURLRequest *)request completion:(MSAuthenticationCompletion)completionHandler
{
    NSAssert(self.userAccount, @"OAuth2AuthenticationProvider must have logged in account before trying to append auth headers");
    NSAssert(self.userAccount.accessToken, @"OAuth2AuthenticationProvider user account is missing access token");
    NSParameterAssert(request);
    NSParameterAssert(completionHandler);
    
    // If token is expired don't bother starting this connection.
    NSDate *tenSecondsAgo = [NSDate dateWithTimeIntervalSinceNow:(-10)];
    NSDate *tokenExpiresAt = self.userAccount.accessToken.expiresAt;
    if (self.userAccount.accessToken.refreshToken
        && [tenSecondsAgo earlierDate:tokenExpiresAt] == tokenExpiresAt)
    {
        [self.userAccount.oauthClient refreshAccessTokenAndRetryConnection:[[NXOAuth2AuthenticatorRefreshCallback alloc] initWithCompletionHandler:^() {
            NSString *oauthAuthorizationHeader = [NSString stringWithFormat:@"%@ %@", self.userAccount.accessToken.tokenType, self.userAccount.accessToken.accessToken];
            [request setValue:oauthAuthorizationHeader forHTTPHeaderField:MS_API_HEADER_AUTHORIZATION];
            completionHandler(request, nil);
        }]];
    }
    else {
        NSString *oauthAuthorizationHeader = [NSString stringWithFormat:@"%@ %@", self.userAccount.accessToken.tokenType, self.userAccount.accessToken.accessToken];
        [request setValue:oauthAuthorizationHeader forHTTPHeaderField:MS_API_HEADER_AUTHORIZATION];
        completionHandler(request, nil);
    }
}

#pragma mark - Helpers and Callbacks

- (void)authorizationFlowCompletedWithURL:(NSURL *)endURL
                                    error:(NSError *)error
                 presentingViewController:(UIViewController *)presentingViewController
                               completion:(AuthCompletion)completionHandler
{
    // Always remove the auth view when we finished loading.
    dispatch_async(dispatch_get_main_queue(), ^{
        [presentingViewController dismissViewControllerAnimated:NO completion:nil];
    });
    
    if (!error)
    {
        if ([[NXOAuth2AccountStore sharedStore] handleRedirectURL:endURL]) {
            self.pendingAuthCompletion = completionHandler;
            // Completion delayed until we get one of the following:
            //   NXOAuth2AccountStoreAccountsDidChangeNotification
            //   NXOAuth2AccountStoreDidFailToRequestAccessNotification
        } else {
            completionHandler([NSError errorWithDomain:MS_AUTH_ERROR_DOMAIN
                                                  code:MSAuthErrorTypeInvalidAccountType
                                              userInfo:@{}]);
        }
    }
    else{
        completionHandler(error);
    }
}

- (void)onAccountStoreAccountsDidChange:(NSNotification*)notification {
    NXOAuth2Account *account = notification.userInfo[NXOAuth2AccountStoreNewAccountUserInfoKey];
    if (self.pendingAuthCompletion && account) {
        self.userAccount = account;
        self.pendingAuthCompletion(nil);
        self.pendingAuthCompletion = nil;
        
        [self setLastSuccessfulLoginIdentifier:self.userAccount.identifier];
    }
}

- (void)onAccountStoreAuthFailed:(NSNotification*)notification {
    NSError *error = [notification.userInfo objectForKey:NXOAuth2AccountStoreErrorKey];
    if (self.pendingAuthCompletion) {
        self.pendingAuthCompletion(error);
        self.pendingAuthCompletion = nil;
    }
}

#pragma mark - User preference
- (void)setLastSuccessfulLoginIdentifier:(NSString *)identifier {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:identifier forKey:lastIdentifierKey];
    [userDefaults synchronize];
}

- (NSString *)lastSuccessfulLoginIdentifier {
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:lastIdentifierKey];
}

@end
