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

        self.navigationController?.navigationBar.barStyle = .black
        
        modifyTableStyle()
        
        let nib = UINib(nibName: "ContactCell", bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: "ContactCell")
        
        loadManualContact()
        loadPhoneContact()
        
        let rightAddBarButtonItem:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonSystemItem.add, target: self, action: #selector(PhoneController.addClick))
        
        self.navigationItem.setRightBarButtonItems([rightAddBarButtonItem], animated: true)
     
        self.definesPresentationContext = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        reloadTable()
    }
    
    func reloadTable(){
        contacts = ContactDbHelper.getContactsByType(ContactType.manual)
        contacts.append(ContactDbHelper.getContactsByType(ContactType.phone))
        self.tableView.reloadData()
    }

    
    func loadManualContact(){
        
        let manualContacts = ContactDbHelper.getContactsByType(ContactType.manual)
        if manualContacts.count > 0{
            NSLog("Load manual contact from DB")
            self.contacts.append(contentsOf: manualContacts)
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
                case .success:
                    NSLog("Validation Successful")
                case .failure(let error):
                    NSLog("\(error)")
                }
                
                // Save sip account information to NSUserdefaults
                if let contactList = response.result.value as? [AnyObject]{
                    for contact in contactList{
                        let name = contact["name"] as! String
                        let phoneList = contact["phone_list"] as! [String]
                        NSLog("Name: \(name)," + "PhoneList: \(phoneList)")
                        
                        ContactDbHelper.addContect(name, phoneList: phoneList, type: ContactType.manual)
                    }
                    ContactDbHelper.save()
                    
                    self.contacts.append(contentsOf: ContactDbHelper.getContactsByType(ContactType.manual))
                    DispatchQueue.main.async(execute: { () -> Void in
                        self.tableView.reloadData()
                    })
                }
        }
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
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(PhoneController.favoriteClick))
        singleTap.numberOfTapsRequired = 1
        cell.favoriteImage.addGestureRecognizer(singleTap)
        cell.favoriteImage.tag = indexPath.row
        
        
        if (contact.isFavorite == true) {
            cell.favoriteImage.image = UIImage(named: "star_red_16dp")
        }else{
            cell.favoriteImage.image = UIImage(named: "star_gray_16dp")
        }
        
        return cell
    }
    
    fileprivate func modifyTableStyle(){
        // Set tableView padding
        self.navigationController?.navigationBar.isTranslucent = true
        
        self.navigationController?.navigationBar.barStyle = .black
        
        tableView.backgroundColor = UIColor(colorLiteralRed: 249/255, green: 244/255, blue: 242/255, alpha: 1)
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
    
    func addClick(_ sender:UIButton){
        NSLog("Add Tapped")
        
        let contactMethodChooser = UIAlertController(title: nil, message: nil, preferredStyle: .actionSheet)
        
        contactMethodChooser.addAction(UIAlertAction(title: "名片掃描", style: UIAlertActionStyle.default, handler: {(UIAlertAction) -> Void in
            self.performSegue(withIdentifier: "scan", sender: nil)
        }))
        
        contactMethodChooser.addAction(UIAlertAction(title: "手動輸入", style: UIAlertActionStyle.default,
            handler: {(UIAlertAction) -> Void in
            self.performSegue(withIdentifier: "addContact", sender: nil)
            })
        )
        contactMethodChooser.addAction(UIAlertAction(title: "取消", style: UIAlertActionStyle.cancel, handler: nil))
        
        self.present(contactMethodChooser, animated: true, completion: nil)
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


extension PhoneController {
    
    // MARK: Segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = (searchController.isActive) ? searchContacts[indexPath.row] : contacts[indexPath.row]
        let phones = contact.phones

        selectContactIndex = indexPath.row
        
        if phones.count == 0 {
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because no phone number available", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            tableView.deselectRow(at: indexPath, animated: true)
            
        }else if phones.count == 1 {
            self.targetPhone = phones[0]
            self.performSegue(withIdentifier: "makeCall", sender: nil)
            
        }else{
            let alertController = UIAlertController(title: "Select Phone Number", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
            
            for phone in phones {
                alertController.addAction(UIAlertAction(title: "Call: " + phone, style: UIAlertActionStyle.default, handler: {(UIAlertAction) -> Void in
                    self.targetPhone = phone
                    self.performSegue(withIdentifier: "makeCall", sender: nil)
                }))
                
            }
            alertController.popoverPresentationController?.sourceView = view
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("prepareForSegue: \(segue.identifier)")
        
        if(segue.identifier == "makeCall"){
            
            let controller = segue.destination as! OutgoingCallController
            
            if let phone = targetPhone, let index = selectContactIndex {
                let contact = (searchController.isActive) ? searchContacts[index] : contacts[index]

                controller.phoneNumber = phone
                controller.calleeName = contact.name
                controller.phoneType = .nonsip
                controller.calleeID = contact.objectID

                contact.usageCount = (contact.usageCount?.floatValue)! + 1
                ContactDbHelper.updateContact(contact)

                
            }else{
                let alertController = UIAlertController(title: "Oops", message: "We can't proceed because no phone number", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
}


extension PhoneController {
    
    func loadPhoneContact(){
        
        let savedPhoneContact = ContactDbHelper.getContactsByType(ContactType.phone)
        if(savedPhoneContact.count > 0){
            contacts += savedPhoneContact
            self.tableView.reloadData()
            return
        }
        
        let store = CNContactStore()
        store.requestAccess(for: .contacts, completionHandler: {
            granted, error in
            
            guard granted else {
                let alert = UIAlertController(title: "無法存取本機連絡人", message: "請至「設定」-> 「GoodWox」開啟連絡人權限", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true, completion: nil)
                return
            }
            
            let keysToFetch = [CNContactFormatter.descriptorForRequiredKeys(for: .fullName), CNContactPhoneNumbersKey] as [Any]
            let request = CNContactFetchRequest(keysToFetch: keysToFetch as! [CNKeyDescriptor])
            var cnContacts = [CNContact]()
            
            do {
                try store.enumerateContacts(with: request){
                    (contact, cursor) -> Void in
                    cnContacts.append(contact)
                }
            } catch let error {
                NSLog("Fetch contact error: \(error)")
            }
            
            NSLog(">>>> Contact list:")
            for contact in cnContacts {
                let fullName = CNContactFormatter.string(from: contact, style: .fullName) ?? "No Name"
                
                var phones = [String]()
                
                for phoneLabeled in contact.phoneNumbers{
                    phones.append((phoneLabeled.value ).value(forKey: "digits") as! String)
                }
                
                ContactDbHelper.addContect(fullName, phoneList: phones, type: ContactType.phone)
                NSLog("\(fullName): \(contact.phoneNumbers.description)")
            }
            
            ContactDbHelper.save()
            
            self.contacts += ContactDbHelper.getContactsByType(ContactType.phone)
            
            DispatchQueue.main.async(execute: { () -> Void in
                self.tableView.reloadData()
            })
        })
    }
}
