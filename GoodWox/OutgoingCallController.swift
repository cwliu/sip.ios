import Foundation

var thisNavigationController: UINavigationController?

var outgoingCallStateChanged: LinphoneCoreCallStateChangedCb = {
    (lc: COpaquePointer, call: COpaquePointer, callSate: LinphoneCallState,  message) in
    
    switch callSate{
    case LinphoneCallError: /**<The call encountered an error*/
        NSLog("outgoingCallStateChanged: LinphoneCallError")
        thisNavigationController?.popViewControllerAnimated(true)
        
    case LinphoneCallEnd:
        NSLog("outgoingCallStateChanged: LinphoneCallEnd")
        thisNavigationController?.popViewControllerAnimated(true)
        
    default:
        NSLog("outgoingCallStateChanged: Default call state")
    }
}

class OutgoingCallController: UIViewController{
    
    var sipNumber: String?
    var calleeName: String?
    
    @IBOutlet var sipNumberLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var lct: LinphoneCoreVTable = LinphoneCoreVTable()
    
    override func viewDidLoad() {
        NSLog("OutgoingCallController.viewDidLoad()")
        
        thisNavigationController = navigationController
        
        self.navigationItem.hidesBackButton = true
        
        if let calleeSipAccount = sipNumber, lc = LinphoneManager.lc {
            sipNumberLabel.text = sipNumber!
            nameLabel.text = calleeName!
            linphone_core_invite(lc, calleeSipAccount)
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
