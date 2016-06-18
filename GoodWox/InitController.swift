import Foundation
import CoreData

class InitController: UIViewController{
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    let authentication: Authentication = Authentication()
    
    override func viewDidAppear(animated: Bool) {
        
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)

        loadingUI(show: true)
        
        
        // If contact empty
        downloadMicrosoftGraphContact()
    }
    
    lazy var graphClient: MSGraphClient = {
        let client = MSGraphClient.defaultClient()
        return client
    }()
    
    func downloadMicrosoftGraphContact(){
        
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
                    
                    if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext{
                        //
                        let contact = NSEntityDescription.insertNewObjectForEntityForName("Contact", inManagedObjectContext: managedObjectContext) as! Contact
                        
                        do {
                            try Exception.catchException {
                                contact.name = user.displayName
                                contact.email = user.mail
                                contact.uid = user.entityId
                                contact.type = ContactType.COMPANY.hashValue                                
                            }
                            try managedObjectContext.save()
                        } catch let error{
                            NSLog("NSError ocurred: \(error)")
                        }
                        
                    }
                }
            }
            
            self.finish()
        }
    }
    
    func finish(){
        loadingUI(show: false)
        self.performSegueWithIdentifier("main", sender: nil)
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
