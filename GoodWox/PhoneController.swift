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
                        
                        ContactDbHelper.addContect(name, phoneList: phoneList, type: ContactType.MANUAL)
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

extension PhoneController {
    
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
            
            let contact = self.contacts[indexPath!.row]
            if contact.phones.count > 0{
                controller.sipNumber = contact.phones[0]
                controller.calleeName = self.contacts[indexPath!.row].name
                
            }else{
                let alertController = UIAlertController(title: "Oops", message: "We can't proceed because no SIP number", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
}