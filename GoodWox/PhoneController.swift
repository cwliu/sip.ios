import Foundation
import Alamofire

class PhoneController: UITableViewController{
    
    override func viewDidLoad() {
        // Download manual contact
        
        Alamofire.request(.GET, "https://sipphone-web-staging.azurewebsites.net/api/v1/contacts/", parameters: ["email": UserData.getGraphAccount()!, "backend_access_token": UserData.getBackendAccessToken()!])
            .responseJSON { response in
                
                NSLog("response.request: \(response.request)")  // original URL request
                NSLog("esponse.response: \(response.response)") // URL response
                
                switch response.result {
                case .Success:
                    NSLog("Validation Successful")
                case .Failure(let error):
                    NSLog("\(error)")
                }
                
                // Save sip account information to NSUserdefaults
                if let contactList = response.result.value as? [AnyObject]{
                    for contact in contactList{
                        let name = contact["name"] as! String
                        let phoneList = contact["phone_list"] as! [String]
                        NSLog("Name: \(name)," + "PhoneList: \(phoneList)")
                    }
                }
        }
        
        self.navigationController?.navigationBar.barStyle = .Black
    }
}