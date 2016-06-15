
import Foundation
import Alamofire

class ApiClient {
    
    func getSipAccount(){
        
        // Get MG Token
        let authentication: Authentication = Authentication()
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
        
        let preferencesRead = NSUserDefaults.standardUserDefaults()
        if let accessToken = preferencesRead.stringForKey("graphAccessToken"),
            email = preferencesRead.stringForKey("graphEmail"){
            
            Alamofire.request(.POST, "https://sipphone-web-staging.azurewebsites.net/api/v1/sips/", parameters: ["email": email, "access_token": accessToken])
                .responseJSON { response in
                    
                    NSLog(">>>>>>>>")
                    print("response.request: \(response.request)")  // original URL request
                    print(response.response) // URL response
                    
                    switch response.result {
                    case .Success:
                        print("Validation Successful")
                    case .Failure(let error):
                        print(error)
                    }
                    
                    if let JSON = response.result.value {
                        print("JSON: \(JSON)")
                    }
            }
            
        }
    }
}
