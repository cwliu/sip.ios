/*
 * Copyright (c) Microsoft. All rights reserved. Licensed under the MIT license.
 * See LICENSE in the project root for license information.
 */


import Foundation

struct Authentication {
    var authenticationProvider: NXOAuth2AuthenticationProvider?
        {
        get {
            return NXOAuth2AuthenticationProvider.sharedAuth()
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
                                     completion:@escaping (_ error: MSGraphError?) -> Void) {
        
        // Set client ID
        NXOAuth2AuthenticationProvider.setClientId(clientId, scopes: scopes)
        
        // Try silent log in. This will attempt to sign in if there is a previous successful
        // sign in user information.
        if NXOAuth2AuthenticationProvider.sharedAuth().loginSilent() == true {
            completion(nil)
        }
            // Otherwise, present log in controller.
        else {
            NXOAuth2AuthenticationProvider.sharedAuth()
                .login(with: nil) { (error: NSError?) in
                    
                    if let nserror = error {
                        completion(error: MSGraphError.nsErrorType(error: nserror))
                    }
                    else {
                        completion(error: nil)
                    }
            }
        }
    }
    
    func disconnect() {
        NXOAuth2AuthenticationProvider.sharedAuth().logout()
    }
    
    func getAccessToken() -> String {
        
        return NXOAuth2AuthenticationProvider.sharedAuth().tokenURL
    }

}
