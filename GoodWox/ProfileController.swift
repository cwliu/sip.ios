import Foundation
import UIKit

class ProfileController: UIViewController{
    
    @IBOutlet var nameLabel: UILabel!
    
    let authentication: Authentication = Authentication()
    
    lazy var graphClient: MSGraphClient = {
        let client = MSGraphClient.defaultClient()
        return client
    }()
    
    override func viewDidLoad(){
        
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
        //        self.getMeInfo()
        
        self.nameLabel.text = UserData.getGraphName()
        
        self.navigationController?.navigationBar.barStyle = .Black
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
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
        
        // Graph logout
        authentication.disconnect()
        
        UserData.clear()
        
        // Delete DB
        ContactDbHelper.deleteAll()
        
        // linphone unregister
        LinphoneManager.unregister()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("LoginController") as! LoginController
        self.presentViewController(vc, animated: true, completion: nil)        
    }
}