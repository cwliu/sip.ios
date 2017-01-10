import Foundation
import Alamofire

class SipApiClient {
    
    func initSip(_ completionHandler: @escaping (Bool)-> Void){
        
        if UserData.getSipAccount() != nil {
            self.startLinphone()
            completionHandler(true)
        }else{
            login(completionHandler)
        }
    }
    
    func login(_ completionHandler: @escaping ((Bool)-> Void)){
        
        let authentication: Authentication = Authentication()
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
        
        guard let email = UserData.getGraphAccount() else {
            return
        }
        
        let request = NSMutableURLRequest(url: URL(string: SipServerBackend.sipURL)!)
        request.httpMethod = "POST"
        
        authentication.authenticationProvider?.appendAuthenticationHeaders(request, completion: { (request, error) in
            
            let token = request?.value(forHTTPHeaderField: "Authorization")!.replacingOccurrences(of: "Bearer ", with: "")
            
            let body = "email=\(email)&access_token=\(token)"
            request?.httpBody = body.data(using: String.Encoding.utf8)
            
            Alamofire.request(request).responseJSON { response in
                
                NSLog("response.request: \(response.request)")  // original URL request
                NSLog("esponse.response: \(response.response)") // URL response
                
                switch response.result {
                case .success:
                    NSLog("Validation Successful")
                case .failure(let error):
                    // Logout
                    NSLog("\(error), \(String(data: response.data!, encoding: String.Encoding.utf8))")
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
                            if let phone = account["phone"]{
                                contact.phones.append(phone as! String)                                
                            }
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
        DispatchQueue.main.async(execute: {
            let lm = LinphoneManager()
            lm.startLinphone()
        })
    }
}
