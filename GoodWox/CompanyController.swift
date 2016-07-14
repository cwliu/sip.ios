import Foundation
import CoreData
import Haneke

class CompanyController: UITableViewController, UISearchResultsUpdating{
    
    var contacts: [Contact] = []
    var searchContacts: [Contact] = []
    
    let authentication: Authentication = Authentication()
    
    var sipNumber: String? = nil
    var searchController: UISearchController!

    override func viewDidLoad() {
        NSLog("CompanyController.viewDidLoad()")
        addSearchBar()
        
        //Init Microsoft Graph
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
        
        modifyTableStyle()
        
        contacts = ContactDbHelper.getContactsByType(ContactType.COMPANY)
        
        let nib = UINib(nibName: "ContactCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "ContactCell")
        
        self.definesPresentationContext = true
    }
    
    func favoriteClick(sender: UITapGestureRecognizer) {
        NSLog("Single Tap on favoriteClick")
        
        
        if let index = sender.view?.tag{
            let contact = self.contacts[index]
            
            if(contact.isFavorite == true){
                contact.isFavorite = false
            }else{
                contact.isFavorite = true
            }
            
            ContactDbHelper.updateContact(self.contacts[index])
        }
        
        self.tableView.reloadData()
    }
    
    // MARK: Style
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.active {
            return searchContacts.count
        }else{
            return contacts.count
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let contact = (searchController.active) ? searchContacts[indexPath.row] : contacts[indexPath.row]
        
        let cell = tableView.dequeueReusableCellWithIdentifier("ContactCell", forIndexPath: indexPath)as! ContactCell
        cell.backgroundColor = UIColor(colorLiteralRed: 249/255, green: 244/255, blue: 242/255, alpha: 1)
        
        cell.nameLabel.text = "\(contact.name ?? "No name")"
        
        
        cell.favoriteImage.userInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(CompanyController.favoriteClick))
        singleTap.numberOfTapsRequired = 1
        cell.favoriteImage.addGestureRecognizer(singleTap)
        cell.favoriteImage.tag = indexPath.row
        
        
        if (contact.isFavorite == true) {
            cell.favoriteImage.image = UIImage(named: "star_red_16dp")
            cell.nameLabel.textColor = UIColor(hex: "#E0454B")
        }else{
            cell.favoriteImage.image = UIImage(named: "star_gray_16dp")
            cell.nameLabel.textColor = UIColor(hex: "#2B2725")
        }
        
        
        // Display contact
        
        let url = NSURL(string: String(format: MicrosoftGraphApi.userPhotoURL, contact.email!))
        let request = NSMutableURLRequest(URL: url!)
        
        cell.avatarImage.image = UIImage(named: "avatar_gray_30dp")
        
        authentication.authenticationProvider?.appendAuthenticationHeaders(request, completion: { (request, error) in
            
            let token = request.valueForHTTPHeaderField("Authorization")!
            let fetcher = BearerHeaderNetworkFetcher<UIImage>(URL: url!, token: token)
            
            cell.avatarImage.hnk_setImageFromFetcher(fetcher)
            
            // Circular image
            cell.avatarImage.layer.cornerRadius = 15
            cell.avatarImage.clipsToBounds = true
            
        })
        
        return cell
    }
    
    private func modifyTableStyle(){
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.barStyle = .Black
        tableView.backgroundColor = UIColor(colorLiteralRed: 249/255, green: 244/255, blue: 242/255, alpha: 1)
    }
    
    
    // MARK: Segue
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        self.performSegueWithIdentifier("makeCall", sender: nil)
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("prepareForSegue: \(segue.identifier)")
        
        
        let indexPath = self.tableView.indexPathForSelectedRow

        if(segue.identifier == "makeCall"){
            
            let controller = segue.destinationViewController as! OutgoingCallController
            let contact = (searchController.active) ? searchContacts[indexPath!.row] : contacts[indexPath!.row]
            if let sip = contact.sip{
                controller.phoneNumber = sip
                controller.calleeName = contact.name
                controller.phoneType = .SIP
                controller.calleeID = contact.objectID
                
                let contact = self.contacts[indexPath!.row]
                contact.usageCount = (contact.usageCount?.floatValue)! + 1
                ContactDbHelper.updateContact(contact)
                
            }else{
                let alertController = UIAlertController(title: "Oops", message: "We can't proceed because no SIP number", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
    
    override func viewWillAppear(animated: Bool) {
        contacts = ContactDbHelper.getContactsByType(ContactType.COMPANY)
        self.tableView.reloadData()
    }
    
    func addSearchBar(){
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.barTintColor = UIColor(colorLiteralRed: 249/255, green: 244/255, blue: 242/255, alpha: 1)
        searchController.searchResultsUpdater = self
        searchController.searchBar.backgroundImage = UIImage()
        searchController.dimsBackgroundDuringPresentation = false
        
        tableView.tableHeaderView = searchController.searchBar
    }
    
    func filterContacts(keyword: String){
        searchContacts = self.contacts.filter({
            (contact: Contact) -> Bool in
            let nameMatch =  contact.name!.rangeOfString(keyword, options: NSStringCompareOptions.CaseInsensitiveSearch)
            return nameMatch != nil
        })
    }
    
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if let searchText = searchController.searchBar.text {
            if searchText == ""{
                searchContacts = contacts
            }else{
                filterContacts(searchText)
            }
            tableView.reloadData()
        }
    }
}
