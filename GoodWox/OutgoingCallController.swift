import Foundation
import CoreData

struct OutgoingCallData{
    static var controller: OutgoingCallController?
    static var callee: Contact?
    static var callTime: NSDate?
    static var callType: CallLogType = CallLogType.OUTGOING_CALL_NO_ANSWER
    static var phoneType: CallPhoneType?
    static var phoneNumber: String?
    static var statusLabel: UILabel?
    static var sipIcon: UIImageView?
    static var calleeName: String?
    static var callConnected: Bool?
    static var retry: Bool = false
}

enum CallPhoneType {
    case SIP
    case NONSIP
    case CALL_END
}

struct OutgoingCallVT{
    static var lct: LinphoneCoreVTable = LinphoneCoreVTable()
}

var outgoingCallStateChanged: LinphoneCoreCallStateChangedCb = {
    (lc: COpaquePointer, call: COpaquePointer, callSate: LinphoneCallState,  message) in
    
    switch callSate{
    case LinphoneCallOutgoingProgress:
        if OutgoingCallData.retry == true{
            OutgoingCallData.retry = false
        }
        
    case LinphoneCallConnected:
        NSLog("outgoingCallStateChanged: LinphoneCallConnected")
        
        OutgoingCallData.callType = CallLogType.OUTGOING_CALL_ANSWERED
        OutgoingCallData.controller?.statusLabel.text = "Connected"
        OutgoingCallData.callConnected = true
        
    case LinphoneCallError: /**<The call encountered an error, will not call LinphoneCallEnd*/
        NSLog("outgoingCallStateChanged: LinphoneCallError")
        
        OutgoingCallData.callType = CallLogType.OUTGOING_CALL_NO_ANSWER

        if OutgoingCallData.phoneType == CallPhoneType.SIP && OutgoingCallData.callee?.phones.count != 0{
            OutgoingCallData.retry = true
            OutgoingCallData.phoneType = CallPhoneType.NONSIP
            OutgoingCallData.phoneNumber = OutgoingCallData.callee?.phones[0]
            makeCall()
            return
        }
        
        // If call type is SIP and phone number is available
        if OutgoingCallData.retry == false {
            close()
        }
        
    case LinphoneCallEnd:
        NSLog("outgoingCallStateChanged: LinphoneCallEnd")
        
        
        if OutgoingCallData.retry == false {
            close()
        }
        
    default:
        NSLog("outgoingCallStateChanged: Default call state \(callSate)")
    }
}

func resetOutgoingCallData(){
    OutgoingCallData.callType = CallLogType.OUTGOING_CALL_NO_ANSWER // Reset state
    OutgoingCallData.callee = nil
    OutgoingCallData.callTime = nil
    OutgoingCallData.callConnected = false
    OutgoingCallData.retry = false
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

func makeCall(){
    switch OutgoingCallData.phoneType! {
        
    case CallPhoneType.SIP:
        OutgoingCallData.sipIcon!.hidden = false
        OutgoingCallData.statusLabel!.text = "SIP Dialing..."
        
    case CallPhoneType.NONSIP:
        OutgoingCallData.sipIcon!.hidden = true
        OutgoingCallData.statusLabel!.text = "Dialing to \(OutgoingCallData.phoneNumber!)..."
        
    case CallPhoneType.CALL_END:
        OutgoingCallData.statusLabel!.text = "Call end"
    }
    
    if let phone = OutgoingCallData.phoneNumber {
        if let lc = theLinphone.lc {
            linphone_core_invite(lc, phone)
        }
        
        if OutgoingCallData.phoneType == CallPhoneType.SIP {
            // Fire a timer to auto call mobile if not connect
            OutgoingCallController.addEndSipCallTimer()
        }
    }
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
        
        resetOutgoingCallData()
        
        OutgoingCallData.controller = self
        OutgoingCallData.callTime = NSDate()
        OutgoingCallData.phoneType = phoneType
        OutgoingCallData.phoneNumber = phoneNumber
        OutgoingCallData.statusLabel = statusLabel
        OutgoingCallData.sipIcon = sipIcon
        OutgoingCallData.calleeName = calleeName
        
        
        nameLabel.text = calleeName
        
        if let calleeID = calleeID{
            OutgoingCallData.callee = ContactDbHelper.getContactById(calleeID)
        }else{
            OutgoingCallData.callee = nil
        }
        
        self.navigationItem.hidesBackButton = true
        
        makeCall()
        if OutgoingCallData.callee?.type == ContactType.COMPANY.hashValue{
            showAvatar(OutgoingCallData.phoneNumber!)
        }
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
        OutgoingCallData.phoneType = CallPhoneType.CALL_END
        
        NSLog("OutgoingCallController.hangUp()")
        terminateCall()
    }
    
    func terminateCall(){
        let call = linphone_core_get_current_call(theLinphone.lc!)
        if call != nil {
            let result = linphone_core_terminate_call(theLinphone.lc!, call)
            NSLog("Terminated call result(outgoing): \(result)")
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
    
    static func addEndSipCallTimer(){
        NSTimer.scheduledTimerWithTimeInterval(
            11, target: OutgoingCallController.self, selector: #selector(callPhoneIfSipNotConnect), userInfo: nil, repeats: false)
    }
    
    @objc static func callPhoneIfSipNotConnect(){
        if OutgoingCallData.callConnected == false &&
            OutgoingCallData.phoneType == CallPhoneType.SIP
            && OutgoingCallData.callee?.phones.count != 0{
            
            OutgoingCallData.retry = true
            
            let call = linphone_core_get_current_call(theLinphone.lc!)
            if call != nil {
                let result = linphone_core_terminate_call(theLinphone.lc!, call)
                NSLog("Terminated call result(outgoing): \(result)")
            }
            
            OutgoingCallData.phoneType = CallPhoneType.NONSIP
            OutgoingCallData.phoneNumber = OutgoingCallData.callee?.phones[0]
            makeCall()
            return
        }
    }
}
