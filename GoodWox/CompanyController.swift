import Foundation

class CompanyController: UITableViewController{
    
    var authentication: Authentication!
    var contactStore: ContactStore?
    
    lazy var graphClient: MSGraphClient = {
        let client = MSGraphClient.defaultClient()
        return client
    }()
    
    override func viewDidLoad() {

        // Init
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)

        
        modifyTableStyle()
        
        downloadCompanyContact()
    }
    
    func downloadCompanyContact(){
        
        contactStore = ContactStore()
        
        // Download contact data from Office 365
        self.graphClient.users().request().getWithCompletion{
            (collection: MSCollection?, request:MSGraphUsersCollectionRequest?, error: NSError?) in
            
            if let _ = error {
                return
            }
            
            if let users = collection {
                for user: MSGraphUser in users.value as! [MSGraphUser] {
                    if user.userPrincipalName == "T302OfficeAdmin@wiadvance.net" {
                        continue
                    }
                    
                    let contact: Contact = Contact(name: user.displayName, email: user.mail)
                    self.contactStore?.contactList.append(contact)
                }
                NSLog("Reload tableView data after contact data has been downloaded")
                self.tableView.reloadData()
            }
        }
    }
    
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Hello World"
        return cell
    }
    
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    
    // MARK: Style
    private func modifyTableStyle(){
        // Set tableView padding
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
}

