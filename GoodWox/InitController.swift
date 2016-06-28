import Foundation
import CoreData

extension MSGraphUser {
    var optMail: String? {
        let obj = dictionaryFromItem()["mail"]
        if let validResult = obj as? String {
            return validResult
        }
        else {
            return nil
        }
    }
}

class InitController: UIViewController{
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    
    let authentication: Authentication = Authentication()
    
    lazy var graphClient: MSGraphClient = {
        let client = MSGraphClient.defaultClient()
        return client
    }()
    
    override func viewDidAppear(animated: Bool) {
        
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
        
        loadingUI(show: true)
        
        initData()
    }
    
    private func initData(){
        self.graphClient.me().request().getWithCompletion {
            (user: MSGraphUser?, error: NSError?) in
            if let graphError = error {
                print("Error:", graphError)
                dispatch_async(dispatch_get_main_queue(),{
                    NSLog("Graph Error")
                })
                self.errorHandle()
            }
            else {
                guard let userInfo = user else{
                    self.errorHandle()
                    return
                }
                
                UserData.setGraphAccount(userInfo.mail)
                UserData.setGraphName(userInfo.displayName)
                
                self.downloadCompanyContact()
            }
        }
    }
    
    func downloadCompanyContact(){
        
        // Already downloaded
        if ContactDbHelper.getContactsByType(.COMPANY).count != 0{
            SipApiClient().initSip(self.finish)
            return
        }
        
        // Download contact data from Office 365
        self.graphClient.users().request().getWithCompletion{
            (collection: MSCollection?, request:MSGraphUsersCollectionRequest?, error: NSError?) in
            
            if let _ = error {
                NSLog("Contact data download error")
                return
            }
            
            NSLog("Contact data loaded successful")
            if let users = collection {
                
                for user: MSGraphUser in users.value as! [MSGraphUser] {
                    
                    if let mail = user.optMail {
                        if mail != UserData.getGraphAccount()!{
                            ContactDbHelper.addContect(user.displayName, email: mail, type: ContactType.COMPANY)
                        }
                    }
                }
                ContactDbHelper.save()
            }
            
            SipApiClient().initSip(self.finish)
        }
    }
    
    func finish(success: Bool){
        loadingUI(show: false)
        
        if success {
            self.performSegueWithIdentifier("main", sender: nil)
        }else{
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func errorHandle(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("LoginController") as! LoginController
        self.presentViewController(vc, animated: true, completion: nil)
    }
}

private extension InitController {
    func loadingUI(show show: Bool) {
        if show {
            self.activityIndicator.startAnimating()
        }
        else {
            self.activityIndicator.stopAnimating()
        }
    }
}

