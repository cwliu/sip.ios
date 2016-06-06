/*
 * Copyright (c) Microsoft. All rights reserved. Licensed under the MIT license.
 * See LICENSE in the project root for license information.
 */


import Foundation

struct Authentication {
    var authenticationProvider: NXOAuth2AuthenticationProvider?
        {
        get {
            return NXOAuth2AuthenticationProvider.sharedAuthProvider()
        }
    }
}

extension Authentication {
    /**
     Authenticates to Microsoft Graph.
     If a user has previously signed in before and not disconnected, silent log in
     will take place.
     If not, authentication will ask for credentials
     */
    func connectToGraph(withClientId clientId: String,
                                     scopes: [String],
                                     completion:(error: MSGraphError?) -> Void) {
        
        // Set client ID
        NXOAuth2AuthenticationProvider.setClientId(clientId, scopes: scopes)
        
        // Try silent log in. This will attempt to sign in if there is a previous successful
        // sign in user information.
        // NSLog("Access token: " + NXOAuth2AuthenticationProvider.sharedAuthProvider())
        // userAccount.accessToken
        
        if NXOAuth2AuthenticationProvider.sharedAuthProvider().loginSilent() == true {
            completion(error: nil)
        }
            // Otherwise, present log in controller.
        else {
            NXOAuth2AuthenticationProvider.sharedAuthProvider()
                .loginWithViewController(nil) { (error: NSError?) in
                    
                    if let nserror = error {
                        completion(error: MSGraphError.NSErrorType(error: nserror))
                    }
                    else {
                        completion(error: nil)
                    }
            }
        }
    }
    
    func disconnect() {
        NXOAuth2AuthenticationProvider.sharedAuthProvider().logout()
    }
}
