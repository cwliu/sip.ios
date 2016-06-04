// *********************************************************
//
// O365-iOS-Connect, https://github.com/OfficeDev/O365-iOS-Connect
//
// Copyright (c) Microsoft Corporation
// All rights reserved.
//
// MIT License:
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
// *********************************************************

import Foundation

// You will set your application's clientId and redirect URI. You get
// these when you register your application in Azure AD.
let REDIRECT_URL_STRING = "http://localhost/sip"
let CLIENT_ID           = "bc90ca19-2bf5-4f7d-abfd-9ae94f1241dc"
let AUTHORITY           = "https://login.microsoftonline.com/common"

class AuthenticationManager {
    var redirectURL: NSURL
    var authority: String = ""
    var clientId: String = ""
    var dependencyResolver: ADALDependencyResolver

    init () {
        // These are settings that you need to set based on your
        // client registration in Azure AD.
        redirectURL = NSURL(string: REDIRECT_URL_STRING)!
        authority = AUTHORITY
        clientId = CLIENT_ID
        dependencyResolver = ADALDependencyResolver()
    }

    // Use a single authentication manager for the application.
    class var sharedInstance: AuthenticationManager {
        struct Singleton {
            static let instance = AuthenticationManager()
        }
        return Singleton.instance
    }
    
    // Acquire access and refresh tokens from Azure AD for the user
    func acquireAuthTokenWithResourceId(resourceId: String, completionHandler:((Bool) -> Void)) {
        var error: ADAuthenticationError?
        let authContext: ADAuthenticationContext = ADAuthenticationContext(authority: authority, error:&error)
      
        // The first time this application is run, the [ADAuthenticationContext acquireTokenWithResource]
        // manager will send a request to the AUTHORITY (see the const at the top of this file) which
        // will redirect you to a login page. You will provide your credentials and the response will
        // contain your refresh and access tokens. The second time this application is run, and assuming
        // you didn't clear your token cache, the authentication manager will use the access or refresh
        // token in the cache to authenticate client requests.
        // This will result in a call to the service if you need to get an access token.

        authContext.acquireTokenWithResource(resourceId, clientId: clientId, redirectUri: redirectURL) {
            (result:ADAuthenticationResult!) -> Void in

            if result.status.rawValue != AD_SUCCEEDED.rawValue {
                completionHandler(false)
            }
            else {
                let userDefaults = NSUserDefaults.standardUserDefaults()
                
                userDefaults.setObject(result.tokenCacheStoreItem.userInformation.userId, forKey: "LogInUser")
                userDefaults.synchronize()
                
                self.dependencyResolver = ADALDependencyResolver(context: authContext, resourceId: resourceId, clientId: self.clientId , redirectUri: self.redirectURL)
                completionHandler(true)
            }
        }
    }
    
    // Clear the ADAL token cache and remove this application's cookies.
    func clearCredentials () {
        var error: ADAuthenticationError?
        let cache: ADTokenCacheStoring = ADAuthenticationSettings.sharedInstance().defaultTokenCacheStore

        // Clear the token cache
        let allItemsArray = cache.allItemsWithError(&error)
        if (!allItemsArray.isEmpty) {
            cache.removeAllWithError(&error)
        }
    
        // Remove all the cookies from this application's sandbox. The authorization code is stored in the
        // cookies and ADAL will try to get to access tokens based on auth code in the cookie.
        let cookieStore = NSHTTPCookieStorage.sharedHTTPCookieStorage()
        if let cookies = cookieStore.cookies {
            for cookie in cookies {
                cookieStore.deleteCookie(cookie )
            }
        }
    }
}
