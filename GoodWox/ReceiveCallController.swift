import Foundation

import Foundation

var receiveNavigationController: ReceiveCallController?

var receiveCallStateChanged: LinphoneCoreCallStateChangedCb = {
    (lc: COpaquePointer, call: COpaquePointer, callSate: LinphoneCallState,  message) in
    
    switch callSate{
    case LinphoneCallConnected: /**<The call encountered an error*/
        NSLog("receiveCallStateChanged: LinphoneCallConnected")
        receiveNavigationController?.statusLabel.text = "Connected"
        receiveNavigationController?.showEndButton()
        
    case LinphoneCallError: /**<The call encountered an error*/
        NSLog("receiveCallStateChanged: LinphoneCallError")
        receiveNavigationController!.dismissViewControllerAnimated(true, completion: nil)
    
    case LinphoneCallEnd:
        NSLog("receiveCallStateChanged: LinphoneCallEnd")
        receiveNavigationController!.dismissViewControllerAnimated(true, completion: nil)
    
    default:
        NSLog("receiveCallStateChanged: Default call state")
    }
}

class ReceiveCallController: UIViewController{
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var statusLabel: UILabel!
    
    @IBOutlet var acceptButton: UIButton!
    @IBOutlet var declineButton: UIButton!
    @IBOutlet var endButton: UIButton!
    
    
    var lct: LinphoneCoreVTable = LinphoneCoreVTable()
    
    override func viewDidLoad() {
        NSLog("ReceiveCallController.viewDidLoad()")
        
            endButton.hidden = true
        receiveNavigationController = self
        
        self.navigationItem.hidesBackButton = true
        
        let call = linphone_core_get_current_call(theLinphone.lc!)
        let address = linphone_call_get_remote_address_as_string(call)
        let account = getUsernameFromAddress(String.fromCString(address)!)
        
        nameLabel.text = account
        if let contact = ContactDbHelper.getContactBySip(account){
            nameLabel.text = contact.name
            
            
            let url = NSURL(string: String(format: MicrosoftGraphApi.userPhotoURL, contact.email!))
            let request = NSMutableURLRequest(URL: url!)

            let authentication: Authentication = Authentication()
            MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
            authentication.authenticationProvider?.appendAuthenticationHeaders(request, completion: { (request, error) in
                
                let token = request.valueForHTTPHeaderField("Authorization")!
                let fetcher = BearerHeaderNetworkFetcher<UIImage>(URL: url!, token: token)
                
                self.avatarImage.hnk_setImageFromFetcher(fetcher)
                
                // Circular image
                self.avatarImage.layer.cornerRadius = 60
                self.avatarImage.clipsToBounds = true
                
            })
            
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("ReceiveCallController.prepareForSegue()")
    }
    
    @IBAction func endCall(){
        let call = linphone_core_get_current_call(theLinphone.lc!)
        if call != nil {
            linphone_core_decline_call(theLinphone.lc!, call, LinphoneReasonDeclined)
        }
        finish()
    }
    
    @IBAction func answerCall(){
        let call = linphone_core_get_current_call(theLinphone.lc!)
        if call != nil {
            linphone_core_accept_call(theLinphone.lc!, call)
        }else{
            finish()
        }
    }
    
    func finish(){
        let call = linphone_core_get_current_call(theLinphone.lc!)
        if call != nil {
            let result = linphone_core_terminate_call(theLinphone.lc!, call)
            NSLog("Terminated call result(receive): \(result)")
        }
        self.dismissViewControllerAnimated(false, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        NSLog("viewWillAppear: ")
        lct.call_state_changed = receiveCallStateChanged
        linphone_core_add_listener(theLinphone.lc!,  &lct)
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        NSLog("viewDidDisappear: ")
        linphone_core_remove_listener(theLinphone.lc!, &lct)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    func showEndButton(){
        acceptButton.hidden = true
        declineButton.hidden = true
        endButton.hidden = false
    }
}


