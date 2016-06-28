
import UIKit


class RecordController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var contacts: [Contact] = []
    
    let authentication: Authentication = Authentication()
    
    var selectContactIndex: Int?
    var targetPhone: String?
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        NSLog("RecordController.viewDidLoad()")
        
        //Init Microsoft Graph
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
        
        modifyTableStyle()
        
        contacts = ContactDbHelper.getMostContacted()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        let nib = UINib(nibName: "ContactCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(animated: Bool) {
        contacts = ContactDbHelper.getMostContacted()
        self.tableView.reloadData()
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
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.contacts.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let contact = self.contacts[indexPath.row]
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)as! ContactCell
        
        cell.nameLabel.text = "\(contact.name ?? "No name")"
        
        
        cell.favoriteImage.userInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(RecordController.favoriteClick))
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
        if(contact.type ==  ContactType.COMPANY.hashValue) {
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
        }else{
            cell.avatarImage.image = UIImage(named: "avatar_gray_30dp")
            
        }
        
        return cell
    }
    
    private func modifyTableStyle(){
        self.navigationController?.navigationBar.translucent = true
        self.navigationController?.navigationBar.barStyle = .Black
    }
    
    
    // MARK: Segue
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let contact = self.contacts[indexPath.row]
        let phones = contact.phones
        selectContactIndex = indexPath.row
        
        if contact.type == ContactType.COMPANY.hashValue {
            self.performSegueWithIdentifier("makeCall", sender: nil)
            
        } else if phones.count == 0 {
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because no phone number available", preferredStyle: UIAlertControllerStyle.Alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            tableView.deselectRowAtIndexPath(indexPath, animated: true)
            
        }else if phones.count == 1 {
            targetPhone = phones[0]
            self.performSegueWithIdentifier("makeCall", sender: nil)
            
        }else{
            let alertController = UIAlertController(title: "Select Phone Number", message: "", preferredStyle: UIAlertControllerStyle.ActionSheet)
            
            for phone in phones {
                alertController.addAction(UIAlertAction(title: "Call: " + phone, style: UIAlertActionStyle.Default, handler: {(UIAlertAction) -> Void in
                    self.targetPhone = phone
                    self.performSegueWithIdentifier("makeCall", sender: nil)
                }))
                
            }
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil))
            self.presentViewController(alertController, animated: true, completion: nil)
            
        }
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("prepareForSegue: \(segue.identifier)")
        
        
        let indexPath = self.tableView.indexPathForSelectedRow
        let contact = self.contacts[indexPath!.row]
        
        if(segue.identifier == "makeCall"){
            
            let controller = segue.destinationViewController as! OutgoingCallController
            
            if contact.type == ContactType.COMPANY.hashValue, let sip = self.contacts[indexPath!.row].sip{
                controller.phoneNumber = sip
                controller.calleeName = contact.name
                controller.phoneType = .SIP
            }else if contact.type == ContactType.MANUAL.hashValue, let phone = self.targetPhone{
                controller.phoneNumber = phone
                controller.calleeName = contact.name
                controller.phoneType = .NONSIP
            }else if contact.type == ContactType.PHONE.hashValue, let phone = self.targetPhone{
                controller.phoneNumber = phone
                controller.calleeName = contact.name
                controller.phoneType = .NONSIP
            }else{
                let alertController = UIAlertController(title: "Oops", message: "We can't proceed because no phone number", preferredStyle: UIAlertControllerStyle.Alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func segmentControlIndexChanged(sender: UISegmentedControl){
        switch segmentControl.selectedSegmentIndex
        {
        case 0:
            contacts = ContactDbHelper.getMostContacted()
        case 1:
            contacts = []
        default:
            contacts = []
        }
        
        self.tableView.reloadData()
    }
}
