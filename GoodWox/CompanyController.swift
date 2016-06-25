import Foundation
import CoreData
import Haneke

class CompanyController: UITableViewController{
    
    var contacts: [Contact] = []
    
    let authentication: Authentication = Authentication()
    
    var sipNumber: String? = nil
    
    override func viewDidLoad() {
        NSLog("CompanyController.viewDidLoad()")
        
        //Init Microsoft Graph
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
        
        modifyTableStyle()
        
        contacts = ContactDbHelper.getContactsByType(ContactType.COMPANY)
        
        let nib = UINib(nibName: "ContactCell", bundle: nil)
        tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
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
        return self.contacts.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let contact = self.contacts[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)as! ContactCell
        
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
                controller.phoneNumber = sip
                controller.calleeName = self.contacts[indexPath!.row].name
                controller.phoneType = .SIP
                
            }else{
                let alertController = UIAlertController(title: "Oops", message: "We can't proceed because no SIP number", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
}

