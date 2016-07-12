import Foundation
import Alamofire
import Contacts
import CoreData

class PhoneController: UITableViewController, NSFetchedResultsControllerDelegate, UISearchResultsUpdating{
    
    var contacts = [Contact]()
    var searchContacts = [Contact]()
    
    var targetPhone: String?
    var selectContactIndex: Int?
    var searchController: UISearchController!
    
    override func viewDidLoad() {
        addSearchBar()

        self.navigationController?.navigationBar.barStyle = .Black
        
        modifyTableStyle()
        
        let nib = UINib(nibName: "ContactCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "ContactCell")
        
        loadManualContact()
        loadPhoneContact()
        
        let rightAddBarButtonItem:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.Add, target: self, action: #selector(PhoneController.addClick))
        
        self.navigationItem.setRightBarButtonItems([rightAddBarButtonItem], animated: true)
        
    }
    
    func loadManualContact(){
        
        let manualContacts = ContactDbHelper.getContactsByType(ContactType.MANUAL)
        if manualContacts.count > 0{
            NSLog("Load manual contact from DB")
            self.contacts.appendContentsOf(manualContacts)
            self.tableView.reloadData()
            return
        }
        
        // Download manual contact
        NSLog("Load manual contact from backend")
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
                        
                        ContactDbHelper.addContect(name, phoneList: phoneList, type: ContactType.MANUAL)
                    }
                    ContactDbHelper.save()
                    
                    self.contacts.appendContentsOf(ContactDbHelper.getContactsByType(ContactType.MANUAL))
                    dispatch_async(dispatch_get_main_queue(), { () -> Void in
                        self.tableView.reloadData()
                    })
                }
        }
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
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(PhoneController.favoriteClick))
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
        
        return cell
    }
    
    private func modifyTableStyle(){
        // Set tableView padding
        self.navigationController?.navigationBar.translucent = true
        
        self.navigationController?.navigationBar.barStyle = .Black
        
        tableView.backgroundColor = UIColor(colorLiteralRed: 249/255, green: 244/255, blue: 242/255, alpha: 1)
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
    
    func addClick(sender:UIButton){
        NSLog("Add Tapped")
        
        let contactMethodChooser = UIAlertController(title: nil, message: nil, preferredStyle: .ActionSheet)
        
        contactMethodChooser.addAction(UIAlertAction(title: "名片掃描", style: UIAlertActionStyle.Default, handler: {(UIAlertAction) -> Void in
            self.performSegueWithIdentifier("scan", sender: nil)
        }))
        
        contactMethodChooser.addAction(UIAlertAction(title: "手動輸入", style: UIAlertActionStyle.Default,
            handler: {(UIAlertAction) -> Void in
            self.performSegueWithIdentifier("addContact", sender: nil)
            })
        )
        contactMethodChooser.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.Cancel, handler: nil))
        
        self.presentViewController(contactMethodChooser, animated: true, completion: nil)
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


extension PhoneController {
    
    // MARK: Segue
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let contact = (searchController.active) ? searchContacts[indexPath.row] : contacts[indexPath.row]
        let phones = contact.phones

        selectContactIndex = indexPath.row
        
        if phones.count == 0 {
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because no phone number available", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
        }else if phones.count == 1 {
            self.targetPhone = phones[0]
            self.performSegueWithIdentifier("makeCall", sender: nil)
            
        }else{
            let alertController = UIAlertController(title: "Select Phone Number", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            for phone in phones {
                alertController.addAction(UIAlertAction(title: "Call: " + phone, style: UIAlertActionStyle.Default, handler: {(UIAlertAction) -> Void in
                    self.targetPhone = phone
                    self.performSegueWithIdentifier("makeCall", sender: nil)
                }))
                
            }
            alertController.popoverPresentationController?.sourceView = view
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("prepareForSegue: \(segue.identifier)")
        
        if(segue.identifier == "makeCall"){
            
            let controller = segue.destinationViewController as! OutgoingCallController
            
            if let phone = targetPhone, index = selectContactIndex {
                let contact = self.contacts[index]

                controller.phoneNumber = phone
                controller.calleeName = contact.name
                controller.phoneType = .NONSIP
                controller.calleeID = contact.objectID

                contact.usageCount = (contact.usageCount?.floatValue)! + 1
                ContactDbHelper.updateContact(contact)

                
            }else{
                let alertController = UIAlertController(title: "Oops", message: "We can't proceed because no phone number", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
}


extension PhoneController {
    
    func loadPhoneContact(){
        
        let savedPhoneContact = ContactDbHelper.getContactsByType(ContactType.PHONE)
        if(savedPhoneContact.count > 0){
            contacts += savedPhoneContact
            self.tableView.reloadData()
            return
        }
        
        let store = CNContactStore()
        store.requestAccessForEntityType(.Contacts, completionHandler: {
            granted, error in
            
            guard granted else {
                let alert = UIAlertController(title: "無法存取本機連絡人", message: "請至「設定」-> 「GoodWox」開啟連絡人權限", preferredStyle: .Alert)
                alert.addAction(UIAlertAction(title: "OK", style: .Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
                return
            }
            
            let keysToFetch = [CNContactFormatter.descriptorForRequiredKeysForStyle(.FullName), CNContactPhoneNumbersKey]
            let request = CNContactFetchRequest(keysToFetch: keysToFetch)
            var cnContacts = [CNContact]()
            
            do {
                try store.enumerateContactsWithFetchRequest(request){
                    (contact, cursor) -> Void in
                    cnContacts.append(contact)
                }
            } catch let error {
                NSLog("Fetch contact error: \(error)")
            }
            
            NSLog(">>>> Contact list:")
            for contact in cnContacts {
                let fullName = CNContactFormatter.stringFromContact(contact, style: .FullName) ?? "No Name"
                
                var phones = [String]()
                
                for phoneLabeled in contact.phoneNumbers{
                    phones.append((phoneLabeled.value as! CNPhoneNumber).valueForKey("digits") as! String)
                }
                
                ContactDbHelper.addContect(fullName, phoneList: phones, type: ContactType.PHONE)
                NSLog("\(fullName): \(contact.phoneNumbers.description)")
            }
            
            ContactDbHelper.save()
            
            self.contacts += ContactDbHelper.getContactsByType(ContactType.PHONE)
            
            dispatch_async(dispatch_get_main_queue(), { () -> Void in
                self.tableView.reloadData()
            })
        })
    }
    
    override func viewWillAppear(animated: Bool) {
        contacts = ContactDbHelper.getContactsByType(ContactType.MANUAL)
        contacts.appendContentsOf(ContactDbHelper.getContactsByType(ContactType.PHONE))
        self.tableView.reloadData()
    }
}