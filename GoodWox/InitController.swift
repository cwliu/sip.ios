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
        return client!
    }()
    
    override func viewDidAppear(_ animated: Bool) {
        
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
        
        loadingUI(show: true)
        
        initData()
    }
    
    fileprivate func initData(){
        self.graphClient.me().request().getWithCompletion {
            (user: MSGraphUser?, error: NSError?) in
            if let graphError = error {
                print("Error:", graphError)
                DispatchQueue.main.async(execute: {
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
        if ContactDbHelper.getContactsByType(.company).count != 0{
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
                            ContactDbHelper.addContect(user.displayName, email: mail, type: ContactType.company)
                        }
                    }
                }
                ContactDbHelper.save()
            }
            
            SipApiClient().initSip(self.finish)
        }
    }
    
    func finish(_ success: Bool){
        loadingUI(show: false)
        
        if success {
            self.performSegue(withIdentifier: "main", sender: nil)
        }else{
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    func errorHandle(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginController") as! LoginController
        self.present(vc, animated: true, completion: nil)
    }
}

private extension InitController {
    func loadingUI(show: Bool) {
        if show {
            self.activityIndicator.startAnimating()
        }
        else {
            self.activityIndicator.stopAnimating()
        }
    }
}

