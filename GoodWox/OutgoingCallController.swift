import Foundation

class OutgoingCallController: UIViewController{

    override func viewDidLoad() {
        NSLog("OutgoingCallController.viewDidLoad()")
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("OutgoingCallController.prepareForSegue()")
    }
    
    @IBAction func hangUp(){
        NSLog("OutgoingCallController.hangUp()")
        
        self.dismissViewControllerAnimated(true, completion: {});
    }
}
