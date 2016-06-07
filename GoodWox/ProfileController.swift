import Foundation
import UIKit

extension MSGraphUser {
    //    var optMobilePhone : String? { return self.dictionary["mobilePhone"] as? String }
    var optMail: String { return "boss@wiadvance.com" }
}

class ProfileController: UIViewController{
    
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var authentication: Authentication!
    
    lazy var graphClient: MSGraphClient = {
        let client = MSGraphClient.defaultClient()
        return client
    }()
    
    override func viewDidLoad(){
        
        // Disalbe backbutton
        navigationItem.hidesBackButton = true;
        
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
        self.getUserInfo()
        self.getContactInfo()
    }
    
    private func getUserInfo(){
        self.graphClient.me().request().getWithCompletion {
            (user: MSGraphUser?, error: NSError?) in
            if let graphError = error {
                print("Error:", graphError)
                dispatch_async(dispatch_get_main_queue(),{
                    NSLog("Graph Error")
                })
                
            }
            else {
                guard let userInfo = user else {
                    dispatch_async(dispatch_get_main_queue(),{
                        NSLog("User information loading failed.")
                    })
                    return
                }
                
                dispatch_async(dispatch_get_main_queue(),{
                    NSLog("User information loaded.")
                    self.nameLabel.text = userInfo.displayName
                    self.emailLabel.text = userInfo.mail
                })
                
            }
        }
    }
    
    private func getContactInfo(){
        self.graphClient.users().request().getWithCompletion{
            (collection: MSCollection?, request:MSGraphUsersCollectionRequest?, error: NSError?) in
            if let users = collection {
                for user: MSGraphUser in users.value as! [MSGraphUser] {
                    if user.userPrincipalName == "T302OfficeAdmin@wiadvance.net" {
                        continue
                    }
                    
                    print(user)
                    print(user.mail)
                }
            }
        }
    }
}

// MARK: Actions
private extension ProfileController{
    @IBAction func logout(sender: AnyObject){
        self.disconnect()
    }
    
}


// MARK: Graph Helper
private extension ProfileController{
    func disconnect(){
        authentication.disconnect()        
        self.dismissViewControllerAnimated(true, completion: {});
    }
}
