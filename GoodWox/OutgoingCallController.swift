import Foundation

class OutgoingCallController: UIViewController{

    var sipNumber: String?
    
    @IBOutlet var sipNumberLabel: UILabel!
    
    override func viewDidLoad() {
        NSLog("OutgoingCallController.viewDidLoad()")
        
        self.navigationItem.hidesBackButton = true
        
        if let calleeSipAccount = sipNumber, lc = LinphoneManager.lc {
            sipNumberLabel.text = sipNumber!
            linphone_core_invite(lc, calleeSipAccount)
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("OutgoingCallController.prepareForSegue()")
    }
    
    @IBAction func hangUp(){
        NSLog("OutgoingCallController.hangUp()")
        
        linphone_core_terminate_all_calls(LinphoneManager.lc)
        
        navigationController?.popViewControllerAnimated(true)
    }
}
