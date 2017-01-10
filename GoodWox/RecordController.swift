import UIKit

class RecordController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var contacts: [Contact] = []
    var calllLogs: [CallLog] = []
    
    let authentication: Authentication = Authentication()
    
    var selectContactIndex: Int?
    var targetPhone: String?
    
    @IBOutlet var tableView: UITableView!
    @IBOutlet var segmentControl: UISegmentedControl!
    
    override func viewDidLoad() {
        NSLog("RecordController.viewDidLoad()")
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        modifyTableStyle()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        updateTable()
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
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return contacts.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let contact = self.contacts[indexPath.row]
        
        var cellID = ""
        if segmentControl.selectedSegmentIndex == 0 {
            cellID = "ContactCell"
        }else{
            cellID = "CallLogCell"
        }
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID, for: indexPath)as! ContactCell
        cell.backgroundColor = UIColor(colorLiteralRed: 249/255, green: 244/255, blue: 242/255, alpha: 1)
        
        cell.nameLabel.text = "\(contact.name ?? "No name")"
        
        cell.favoriteImage.isUserInteractionEnabled = true
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(RecordController.favoriteClick))
        singleTap.numberOfTapsRequired = 1
        cell.favoriteImage.addGestureRecognizer(singleTap)
        cell.favoriteImage.tag = indexPath.row
        
        
        if (contact.isFavorite == true) {
            cell.favoriteImage.image = UIImage(named: "star_red_16dp")
        }else{
            cell.favoriteImage.image = UIImage(named: "star_gray_16dp")
        }
        
        if segmentControl.selectedSegmentIndex == 1 {
            var message: String = ""
            
            let callLog = calllLogs[indexPath.row]
            
            if let timeString = getNaturalDateString(callLog.callTime) {
                message += timeString + " ago"
            }
            
            if callLog.type == CallLogType.incoming_CALL_NO_ANSWER.hashValue {
                message += ", missed Call"
            }
            
            if callLog.type == CallLogType.incoming_CALL_ANSWERED.hashValue {
                message += ", " + (callLog.callDuration?.stringValue)! + " sec"
            }
            
            if callLog.type == CallLogType.outgoing_CALL_NO_ANSWER.hashValue {
                message += ", no answer"
            }
            
            if callLog.type == CallLogType.outgoing_CALL_ANSWERED.hashValue {
                message += ", " + (callLog.callDuration?.stringValue)! + "sec"
            }
            
            cell.messageLabel.text = message
            
            switch Int(callLog.type!) {
            case CallLogType.incoming_CALL_ANSWERED.hashValue:
                cell.callTypeIcon.image = UIImage(named: "call_received_blue_12dp")
            case CallLogType.incoming_CALL_NO_ANSWER.hashValue:
                cell.callTypeIcon.image = UIImage(named: "call_missed_red_12dp")
            case CallLogType.outgoing_CALL_ANSWERED.hashValue:
                cell.callTypeIcon.image = UIImage(named: "call_made_green_12dp")
            case CallLogType.outgoing_CALL_NO_ANSWER.hashValue:
                cell.callTypeIcon.image = UIImage(named: "call_made_green_12dp")
            default:
                cell.callTypeIcon.image = UIImage(named: "cell_made_green_12dp")
            }
        }
        
        // Display contact
        if(contact.type ==  ContactType.company.hashValue) {
            let url = URL(string: String(format: MicrosoftGraphApi.userPhotoURL, contact.email!))
            let request = NSMutableURLRequest(url: url!)
            
            authentication.authenticationProvider?.appendAuthenticationHeaders(request, completion: { (request, error) in
                
                let token = request?.value(forHTTPHeaderField: "Authorization")!
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
    
    fileprivate func modifyTableStyle(){
        self.navigationController?.navigationBar.isTranslucent = true
        self.navigationController?.navigationBar.barStyle = .black
        tableView.backgroundColor = UIColor(colorLiteralRed: 249/255, green: 244/255, blue: 242/255, alpha: 1)

    }
    
    
    // MARK: Segue
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let contact = self.contacts[indexPath.row]
        let phones = contact.phones
        selectContactIndex = indexPath.row
        
        if contact.type == ContactType.company.hashValue {
            self.performSegue(withIdentifier: "makeCall", sender: nil)
            
        } else if phones.count == 0 {
            let alertController = UIAlertController(title: "Oops", message: "We can't proceed because no phone number available", preferredStyle: UIAlertControllerStyle.alert)
            alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            tableView.deselectRow(at: indexPath, animated: true)
            
        }else if phones.count == 1 {
            targetPhone = phones[0]
            self.performSegue(withIdentifier: "makeCall", sender: nil)
            
        }else{
            let alertController = UIAlertController(title: "Select Phone Number", message: "", preferredStyle: UIAlertControllerStyle.actionSheet)
            
            for phone in phones {
                alertController.addAction(UIAlertAction(title: "Call: " + phone, style: UIAlertActionStyle.default, handler: {(UIAlertAction) -> Void in
                    self.targetPhone = phone
                    self.performSegue(withIdentifier: "makeCall", sender: nil)
                }))
                
            }
            alertController.addAction(UIAlertAction(title: "Cancel", style: UIAlertActionStyle.cancel, handler: nil))
            self.present(alertController, animated: true, completion: nil)
            
        }
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("prepareForSegue: \(segue.identifier)")
        
        
        let indexPath = self.tableView.indexPathForSelectedRow
        let contact = self.contacts[indexPath!.row]
        
        if(segue.identifier == "makeCall"){
            
            let controller = segue.destination as! OutgoingCallController
            controller.calleeID = contact.objectID
            
            if contact.type == ContactType.company.hashValue, let sip = self.contacts[indexPath!.row].sip{
                controller.phoneNumber = sip
                controller.calleeName = contact.name
                controller.phoneType = .sip
            }else if contact.type == ContactType.manual.hashValue, let phone = self.targetPhone{
                controller.phoneNumber = phone
                controller.calleeName = contact.name
                controller.phoneType = .nonsip
            }else if contact.type == ContactType.phone.hashValue, let phone = self.targetPhone{
                controller.phoneNumber = phone
                controller.calleeName = contact.name
                controller.phoneType = .nonsip
            }else{
                let alertController = UIAlertController(title: "Oops", message: "We can't proceed because no phone number", preferredStyle: UIAlertControllerStyle.alert)
                alertController.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
                self.present(alertController, animated: true, completion: nil)
            }
        }
    }
    
    @IBAction func segmentControlIndexChanged(_ sender: UISegmentedControl){
        updateTable()
    }
    
    func updateTable(){
        switch segmentControl.selectedSegmentIndex{
        case 0:
            let nib = UINib(nibName: "ContactCell", bundle: nil)
            self.tableView.register(nib, forCellReuseIdentifier: "ContactCell")
            contacts = ContactDbHelper.getMostContacted()
        case 1:
            let nib = UINib(nibName: "CallLogCell", bundle: nil)
            self.tableView.register(nib, forCellReuseIdentifier: "CallLogCell")
            
            contacts = []
            calllLogs = CallLogDbHelper.getAll()
            for log in calllLogs{
                if let contact = log.contact {
                    contacts.append(contact)
                }
            }
        default:
            contacts = []
        }
        
        self.tableView.reloadData()
    }
}
