import Foundation
import Alamofire

class SipApiClient {
    
    func initSip(completionHandler: ()-> Void){
     
        if UserData.getSipAccount() != nil {
            startLinphone()
            completionHandler()
            login({})
        }else{
            login(completionHandler)
        }
    }
    func login(completionHandler: (()-> Void)){
        
        let authentication: Authentication = Authentication()
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
        
        guard let accessToken = UserData.getGraphAccessToken() else{
            return
        }
        
        guard let email = UserData.getGraphAccount() else {
            return
        }
        
        Alamofire.request(.POST, "https://sipphone-web-staging.azurewebsites.net/api/v1/sips/", parameters: ["email": email, "access_token": accessToken])
            .responseJSON { response in
                
            NSLog("response.request: \(response.request)")  // original URL request
            NSLog("esponse.response: \(response.response)") // URL response
            
            switch response.result {
            case .Success:
                NSLog("Validation Successful")
            case .Failure(let error):
                // Logout 
                NSLog("\(error)")
            }
            
            // Save sip account information to NSUserdefaults
            if let json = response.result.value as? [String: AnyObject]{
                
                // Set user data
                let sipAccount = json["sip_account"] as! String
                let sipPassword = json["sip_password"] as! String
                let proxyAddress = json["proxy_address"] as! String
                let proxyPort = String(json["proxy_port"] as! Int)
                let backendAccessToken = json["backend_access_token"] as! String
                
                UserData.setSipAccount(sipAccount)
                UserData.setSipPassword(sipPassword)
                UserData.setProxyAddress(proxyAddress)
                UserData.setProxyPort(proxyPort)
                UserData.setBackendAccessToken(backendAccessToken)
                
                let sipList = json["sip_list"] as! [[String: AnyObject]]
                for account: [String: AnyObject] in sipList{
                    
                    if let contact = ContactDbHelper.getContact(account["email"] as! String) {
                        contact.sip = (account["sip_account"]! as! String)
                        // NSLog(String(account["phone"]!))
                    }
                }
                ContactDbHelper.save()
            }
            
            self.startLinphone()
            completionHandler()
        }
    }
    
    func startLinphone(){
        let lm = LinphoneManager()
        lm.startLinphone()
    }
}
