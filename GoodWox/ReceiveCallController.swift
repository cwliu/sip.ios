import Foundation

import Foundation

var receiveNavigationController: ReceiveCallController?

var receiveCallStateChanged: LinphoneCoreCallStateChangedCb = {
    (lc: COpaquePointer, call: COpaquePointer, callSate: LinphoneCallState,  message) in
    
    switch callSate{
    case LinphoneCallError: /**<The call encountered an error*/
        NSLog("outgoingCallStateChanged: LinphoneCallError")
        receiveNavigationController!.dismissViewControllerAnimated(true, completion: nil)
    case LinphoneCallEnd:
        NSLog("outgoingCallStateChanged: LinphoneCallEnd")
        receiveNavigationController!.dismissViewControllerAnimated(true, completion: nil)        
    default:
        NSLog("outgoingCallStateChanged: Default call state")
    }
}

class ReceiveCallController: UIViewController{
    
    var sipNumber: String?
    var calleeName: String?
    
    @IBOutlet var sipNumberLabel: UILabel!
    @IBOutlet var nameLabel: UILabel!
    
    var lct: LinphoneCoreVTable = LinphoneCoreVTable()
    
    override func viewDidLoad() {
        NSLog("ReceiveCallController.viewDidLoad()")
                
        receiveNavigationController = self
        
        self.navigationItem.hidesBackButton = true
        
        if let calleeSipAccount = sipNumber, lc = LinphoneManager.lc {
            sipNumberLabel.text = sipNumber!
            nameLabel.text = calleeName!
            linphone_core_invite(lc, calleeSipAccount)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("ReceiveCallController.prepareForSegue()")
    }
    
    @IBAction func declineCall(){
        let call = linphone_core_get_current_call(LinphoneManager.getLc())
        if call != nil {
            linphone_core_decline_call(LinphoneManager.getLc(), call, LinphoneReasonDeclined)
        }
        finish()
    }
    
    @IBAction func answerCall(){
        let call = linphone_core_get_current_call(LinphoneManager.getLc())
        if call != nil {
            linphone_core_accept_call(LinphoneManager.getLc(), call)
        }else{
            finish()
        }
    }
    
    func finish(){
        linphone_core_terminate_all_calls(LinphoneManager.getLc())
        self.dismissViewControllerAnimated(true, completion: nil)
    }
    
    override func viewWillAppear(animated: Bool) {
        lct.call_state_changed = receiveCallStateChanged
        linphone_core_add_listener(LinphoneManager.getLc(),  &lct)
    }
    
    
    override func viewDidDisappear(animated: Bool) {
        linphone_core_remove_listener(LinphoneManager.getLc(), &lct)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
}


