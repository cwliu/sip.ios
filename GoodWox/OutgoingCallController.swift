import Foundation
import CoreData

struct OutgoingCallData{
    static var controller: OutgoingCallController?
    static var callee: Contact?
    static var callTime: NSDate?
    static var callType: CallLogType = CallLogType.OUTGOING_CALL_NO_ANSWER
}

enum CallPhoneType {
    case SIP
    case NONSIP
}

struct OutgoingCallVT{
    static var lct: LinphoneCoreVTable = LinphoneCoreVTable()
}

var outgoingCallStateChanged: LinphoneCoreCallStateChangedCb = {
    (lc: COpaquePointer, call: COpaquePointer, callSate: LinphoneCallState,  message) in
    
    switch callSate{
    case LinphoneCallConnected:
        NSLog("outgoingCallStateChanged: LinphoneCallConnected")
        
        OutgoingCallData.callType = CallLogType.OUTGOING_CALL_ANSWERED
        OutgoingCallData.controller?.statusLabel.text = "Connected"
        
    case LinphoneCallError: /**<The call encountered an error, will not call LinphoneCallEnd*/
        NSLog("outgoingCallStateChanged: LinphoneCallError")
        
        OutgoingCallData.callType = CallLogType.OUTGOING_CALL_NO_ANSWER
        close()
        
    case LinphoneCallEnd:
        NSLog("outgoingCallStateChanged: LinphoneCallEnd")
        close()
        
    default:
        NSLog("outgoingCallStateChanged: Default call state \(callSate)")
    }
}

func resetOutgoingCallData(){
    OutgoingCallData.callType = CallLogType.OUTGOING_CALL_NO_ANSWER // Reset state
    OutgoingCallData.callee = nil
    OutgoingCallData.callTime = nil
}

func close(){
    
    if let callee = OutgoingCallData.callee, callTime = OutgoingCallData.callTime{
        let callDuration =  Int(NSDate().timeIntervalSinceDate(callTime))
        CallLogDbHelper.addCallLog(
            callee, callTime: callTime, callDuration: callDuration, callType: OutgoingCallData.callType
        )
    }
    
    resetOutgoingCallData()
    OutgoingCallData.controller?.dismissViewControllerAnimated(true, completion: nil)
}

class OutgoingCallController: UIViewController{
    
    var phoneNumber: String?
    var calleeName: String?
    var phoneType: CallPhoneType = .SIP
    var calleeID: NSManagedObjectID?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var sipIcon: UIImageView!
    @IBOutlet var avatarImage: UIImageView!
    
    override func viewDidLoad() {
        NSLog("OutgoingCallController.viewDidLoad()")
        
        OutgoingCallData.controller = self
        OutgoingCallData.callTime = NSDate()
        
        if let calleeID = calleeID{
            OutgoingCallData.callee = ContactDbHelper.getContactById(calleeID)
        }else{
            OutgoingCallData.callee = nil
        }
        
        self.navigationItem.hidesBackButton = true
        
        makeCall()
    }
    
    
    override func viewWillAppear(animated: Bool) {
        OutgoingCallVT.lct.call_state_changed = outgoingCallStateChanged
        linphone_core_add_listener(theLinphone.lc!,  &OutgoingCallVT.lct)
    }
    
    override func viewDidDisappear(animated: Bool) {
        linphone_core_remove_listener(theLinphone.lc!, &OutgoingCallVT.lct)
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
    @IBAction func hangUp(){
        NSLog("OutgoingCallController.hangUp()")
        let call = linphone_core_get_current_call(theLinphone.lc!)
        if call != nil {
            let result = linphone_core_terminate_call(theLinphone.lc!, call)
            NSLog("Terminated call result(outgoing): \(result)")
        }
    }
    
    func makeCall(){
        switch phoneType {
        case .SIP:
            sipIcon.hidden = false
            statusLabel.text = "SIP Dialing..."
            
        case .NONSIP:
            sipIcon.hidden = true
            statusLabel.text = "Dialing to \(phoneNumber!)..."
        }
        
        if let phone = phoneNumber {
            nameLabel.text = calleeName!
            if let lc = theLinphone.lc {
                linphone_core_invite(lc, phone)
            }
            showAvatar(phone)
        }
    }
    
    func showAvatar(phone: String){
        if let contact = ContactDbHelper.getContactBySip(phone){
            if contact.type == ContactType.COMPANY.hashValue {
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
    }
}
