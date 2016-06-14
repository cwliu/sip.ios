import Foundation

class OutgoingCallController: UIViewController{

    var sipNumber: String?
    
    override func viewDidLoad() {
        NSLog("OutgoingCallController.viewDidLoad()")
        
        if let calleeSipAccount = sipNumber {
            linphone_core_invite(LinphoneManager.lc, calleeSipAccount)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("OutgoingCallController.prepareForSegue()")
    }
    
    @IBAction func hangUp(){
        NSLog("OutgoingCallController.hangUp()")
        
        linphone_core_terminate_all_calls(LinphoneManager.lc)
        self.dismissViewControllerAnimated(true, completion: {});
    }
}
