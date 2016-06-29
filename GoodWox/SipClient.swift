import Foundation
import Alamofire

class SipApiClient {
    
    func initSip(completionHandler: (Bool)-> Void){
     
        if UserData.getSipAccount() != nil {
            self.startLinphone()
            completionHandler(true)
        }else{
            login(completionHandler)
        }
    }
    func login(completionHandler: ((Bool)-> Void)){
        
        let authentication: Authentication = Authentication()
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
        
        
        guard let email = UserData.getGraphAccount() else {
            return
        }
                
        let request = NSMutableURLRequest(URL: NSURL(string: SipServerBackend.sipURL)!)
        request.HTTPMethod = "POST"

        authentication.authenticationProvider?.appendAuthenticationHeaders(request, completion: { (request, error) in
            
            let token = request.valueForHTTPHeaderField("Authorization")!.stringByReplacingOccurrencesOfString("Bearer ", withString: "")
            
            let body = "email=\(email)&access_token=\(token)"
            request.HTTPBody = body.dataUsingEncoding(NSUTF8StringEncoding)
            
            Alamofire.request(request).responseJSON { response in
                    
                    NSLog("response.request: \(response.request)")  // original URL request
                    NSLog("esponse.response: \(response.response)") // URL response
                    
                    switch response.result {
                    case .Success:
                        NSLog("Validation Successful")
                    case .Failure(let error):
                        // Logout
                        NSLog("\(error), \(String(data: response.data!, encoding: NSUTF8StringEncoding))")
                        UserData.clear()
                        completionHandler(false)
                        return
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
                            }
                        }
                        ContactDbHelper.save()
                    }
                    
                    self.startLinphone()
                    completionHandler(true)
            }
        })
    }
    
    func startLinphone(){
        dispatch_async(dispatch_get_main_queue(), {
            let lm = LinphoneManager()
            lm.startLinphone()
        })
    }
}
