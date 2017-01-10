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
        
        contacts = ContactDbHelper.getContactsByType(ContactType.company)
        
        let nib = UINib(nibName: "ContactCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ContactCell")
        
        self.definesPresentationContext = true
    }
    
    func favoriteClick(_ sender: UITapGestureRecognizer) {
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
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchController.isActive {
            return searchContacts.count
        }else{
            return contacts.count
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contact = (searchController.isActive) ? searchContacts[indexPath.row] : contacts[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell", for: indexPath)as! ContactCell
        cell.backgroundColor = UIColor(colorLiteralRed: 249/255, green: 244/255, blue: 242/255, alpha: 1)
        
        cell.nameLabel.text = "\(contact.name ?? "No name")"
        
        
        cell.favoriteImage.isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(CompanyController.favoriteClick))
        singleTap.numberOfTapsRequired = 1
        cell.favoriteImage.addGestureRecognizer(singleTap)
        cell.favoriteImage.tag = indexPath.row
        
        
        if (contact.isFavorite == true) {
            cell.favoriteImage.image = UIImage(named: "star_red_16dp")
        }else{
            cell.favoriteImage.image = UIImage(named: "star_gray_16dp")
        }
        
        
        // Display contact
        
        let url = URL(string: String(format: MicrosoftGraphApi.userPhotoURL, contact.email!))
        let request = NSMutableURLRequest(url: url!)
        
        cell.avatarImage.image = UIImage(named: "avatar_gray_30dp")
        
        authentication.authenticationProvider?.appendAuthenticationHeaders(request, completion: { (request, error) in
            
            let token = request?.value(forHTTPHeaderField: "Authorization")!
            let fetcher = BearerHeaderNetworkFetcher<UIImage>(URL: url!, token: token)
            
            cell.avatarImage.hnk_setImageFromFetcher(fetcher)
            
            // Circular image
            cell.avatarImage.layer.cornerRadius = 15
            cell.avatarImage.clipsToBounds = true
            
        })
        
        return cell
    }
    
    fileprivate func modifyTableStyle(){
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barStyle = .black
        tableView.backgroundColor = UIColor(colorLiteralRed: 249/255, green: 244/255, blue: 242/255, alpha: 1)
    }
    
    
    // MARK: Segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.performSegue(withIdentifier: "makeCall", sender: nil)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("prepareForSegue: \(segue.identifier)")
        
        
        let indexPath = self.tableView.indexPathForSelectedRow

        if(segue.identifier == "makeCall"){
            
            let controller = segue.destination as! OutgoingCallController
            let contact = (searchController.isActive) ? searchContacts[indexPath!.row] : contacts[indexPath!.row]
            if let sip = contact.sip{
                controller.phoneNumber = sip
                controller.calleeName = contact.name
                controller.phoneType = .sip
                controller.calleeID = contact.objectID
                
                let contact = self.contacts[indexPath!.row]
                contact.usageCount = (contact.usageCount?.floatValue)! + 1
                ContactDbHelper.updateContact(contact)
                
            }else{
                let alertController = UIAlertController(title: "Oops", message: "We can't proceed because no SIP number", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        contacts = ContactDbHelper.getContactsByType(ContactType.company)
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
    
    func filterContacts(_ keyword: String){
        searchContacts = self.contacts.filter({
            (contact: Contact) -> Bool in
            let nameMatch =  contact.name!.range(of: keyword, options: NSString.CompareOptions.caseInsensitive)
            return nameMatch != nil
        })
    }
    
    func updateSearchResults(for searchController: UISearchController) {
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
