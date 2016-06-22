import Foundation

var outgoingCallController: OutgoingCallController?

enum CallPhoneType {
    case SIP
    case NONSIP
}

var outgoingCallStateChanged: LinphoneCoreCallStateChangedCb = {
    (lc: COpaquePointer, call: COpaquePointer, callSate: LinphoneCallState,  message) in
    
    switch callSate{
    case LinphoneCallError: /**<The call encountered an error*/
        NSLog("outgoingCallStateChanged: LinphoneCallError")
        outgoingCallController?.dismissViewControllerAnimated(true, completion: nil)
        
    case LinphoneCallEnd:
        NSLog("outgoingCallStateChanged: LinphoneCallEnd")
        outgoingCallController?.dismissViewControllerAnimated(true, completion: nil)
        
    default:
        NSLog("outgoingCallStateChanged: Default call state")
    }
}

class OutgoingCallController: UIViewController{
    
    var phoneNumber: String?
    var calleeName: String?
    var phoneType: CallPhoneType = .SIP
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var sipIcon: UIImageView!
    
    var lct: LinphoneCoreVTable = LinphoneCoreVTable()
    
    override func viewDidLoad() {
        NSLog("OutgoingCallController.viewDidLoad()")
        
        outgoingCallController = self
        
        self.navigationItem.hidesBackButton = true
        
        
        switch phoneType {
        case .SIP:
            sipIcon.hidden = false
            statusLabel.text = "SIP Dialing..."
            
        case .NONSIP:
            sipIcon.hidden = true
            statusLabel.text = "Dialing to \(phoneNumber)..."
        }

        if let phone = phoneNumber, lc = LinphoneManager.lc {
            nameLabel.text = calleeName!
            linphone_core_invite(lc, phone)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("OutgoingCallController.prepareForSegue()")
    }
    
    @IBAction func hangUp(){
        NSLog("OutgoingCallController.hangUp()")
        finish()
        
    }
    
    func finish(){
        linphone_core_terminate_all_calls(LinphoneManager.getLc())
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        lct.call_state_changed = outgoingCallStateChanged
        linphone_core_add_listener(LinphoneManager.getLc(),  &lct)
    }
    
    override func viewDidDisappear(animated: Bool) {
        linphone_core_remove_listener(LinphoneManager.getLc(), &lct)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}
