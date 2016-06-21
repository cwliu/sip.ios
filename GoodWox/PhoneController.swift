import Foundation
import Alamofire

class PhoneController: UITableViewController{
    
    var contacts = [Contact]()
    
    override func viewDidLoad() {
        self.navigationController?.navigationBar.barStyle = .Black
        
        modifyTableStyle()

        let nib = UINib(nibName: "ContactCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
        
        loadManualContact()
    }
    
    func loadManualContact(){
        
        self.contacts = ContactDbHelper.getContactByType(ContactType.MANUAL)
        if self.contacts.count > 0{
            NSLog("Load manual contact from DB")
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
                        
                        ContactDbHelper.addContect(name, sip: nil, type: ContactType.MANUAL)
                    }
                    
                    self.contacts = ContactDbHelper.getContactByType(ContactType.MANUAL)
                    self.tableView.reloadData()
                }
        }
    }
    
    // MARK: Style
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let contact = self.contacts[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)as! ContactCell
        
        cell.nameLabel.text = "\(contact.name ?? "No name")"
        
        return cell
    }
    
    private func modifyTableStyle(){
        // Set tableView padding
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
        
        self.navigationController?.navigationBar.barStyle = .Black
    }
}