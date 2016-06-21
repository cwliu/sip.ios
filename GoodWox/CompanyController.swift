import Foundation
import CoreData

class CompanyController: UITableViewController{
    
    var contacts: [Contact] = []
    
    let authentication: Authentication = Authentication()
    
    var sipNumber: String? = nil

    override func viewDidLoad() {
        NSLog("CompanyController.viewDidLoad()")
        
        //Init Microsoft Graph
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
    
        modifyTableStyle()
        
        contacts = ContactDbHelper.getContactByType(ContactType.COMPANY)
        
        let nib = UINib(nibName: "ContactCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
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
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.barStyle = .Black
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
            
            if let sip = self.contacts[indexPath!.row].sip{
                controller.sipNumber = sip
                controller.calleeName = self.contacts[indexPath!.row].name
                
            }else{
                let alertController = UIAlertController(title: "Oops", message: "We can't proceed because no SIP number", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
}
