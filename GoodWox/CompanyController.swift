import Foundation

class CompanyController: UITableViewController{
    
    var contactStore: ContactStore!
    
    let authentication: Authentication = Authentication()
    
    lazy var graphClient: MSGraphClient = {
        let client = MSGraphClient.defaultClient()
        return client
    }()
    
    override func viewDidLoad() {
        NSLog("CompanyController.viewDidLoad()")
        
        self.contactStore = ContactStore()

        //Init Microsoft Graph
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
    
        modifyTableStyle()
        downloadCompanyContact()
    }
    
    func downloadCompanyContact(){
        
        
        // Download contact data from Office 365
        self.graphClient.users().request().getWithCompletion{
            (collection: MSCollection?, request:MSGraphUsersCollectionRequest?, error: NSError?) in
            
            if let _ = error {
                NSLog("Contact data download error")
                return
            }
            NSLog("Contact data successful")
            if let users = collection {
                for user: MSGraphUser in users.value as! [MSGraphUser] {
                    if user.userPrincipalName == "T302OfficeAdmin@wiadvance.net" {
                        continue
                    }

                    let contact: Contact = Contact(name: user.displayName, email: user.mail)
                    NSLog("\(user.displayName)  \(user.mail)")
                    self.contactStore.contactList.append(contact)
                }
                NSLog("Reload tableView data after contact data has been downloaded")
                NSOperationQueue.mainQueue().addOperationWithBlock(){
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        NSLog("self.contactStore.contactList.count: \(self.contactStore.contactList.count)")
        return self.contactStore.contactList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let contact = self.contactStore.contactList[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("company", forIndexPath: indexPath)as! ContactCell

        cell.nameLabel.text = "\(contact.name ?? "No name")"
        
        return cell

    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        let row = indexPath.row
        NSLog("Row: \(row)")
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("prepareForSegue: \(segue.identifier)")
    }
}

