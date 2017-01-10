import Foundation
import CoreData

struct OutgoingCallData{
    static var controller: OutgoingCallController?
    static var callee: Contact?
    static var callTime: Date?
    static var callType: CallLogType = CallLogType.outgoing_CALL_NO_ANSWER
    static var phoneType: CallPhoneType?
    static var phoneNumber: String?
    static var statusLabel: UILabel?
    static var sipIcon: UIImageView?
    static var calleeName: String?
    static var callConnected: Bool?
    static var retry: Bool = false
}

enum CallPhoneType {
    case sip
    case nonsip
    case call_END
}

struct OutgoingCallVT{
    static var lct: LinphoneCoreVTable = LinphoneCoreVTable()
}

var outgoingCallStateChanged: LinphoneCoreCallStateChangedCb = {
    (lc: OpaquePointer, call: OpaquePointer, callSate: LinphoneCallState,  message) in
    
    switch callSate{
    case LinphoneCallOutgoingProgress:
        if OutgoingCallData.retry == true{
            OutgoingCallData.retry = false
        }
        
    case LinphoneCallConnected:
        NSLog("outgoingCallStateChanged: LinphoneCallConnected")
        
        OutgoingCallData.callType = CallLogType.outgoing_CALL_ANSWERED
        OutgoingCallData.controller?.statusLabel.text = "Connected"
        OutgoingCallData.callConnected = true
        
    case LinphoneCallError: /**<The call encountered an error, will not call LinphoneCallEnd*/
        NSLog("outgoingCallStateChanged: LinphoneCallError")
        
        let message = String(cString: message)
        NSLog(message!)
        
//        if message == "Busy Here"{
//            OutgoingCallData.retry = false
//            OutgoingCallData.phoneType = CallPhoneType.NONSIP
//            let alertController = UIAlertController(title: "", message: "使用者無法接聽", preferredStyle: UIAlertControllerStyle.Alert)
//            alertController.addAction(UIAlertAction(title: "關閉", style: UIAlertActionStyle.Default, handler: {
//                (action: UIAlertAction!) in
//                close()
//            }))
//            OutgoingCallData.controller?.presentViewController(alertController, animated: true, completion: nil)
//            
//            dispatch_async(dispatch_get_main_queue()) { () -> Void in
//                
//                dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(2 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), { () -> Void in
//                    alertController.dismissViewControllerAnimated(true, completion: nil)
//                    close()
//                })
//            }
//        }else{
        
        OutgoingCallData.callType = CallLogType.outgoing_CALL_NO_ANSWER
        
        if OutgoingCallData.phoneType == CallPhoneType.sip && OutgoingCallData.callee?.phones.count != 0{
            OutgoingCallData.retry = true
            OutgoingCallData.phoneType = CallPhoneType.nonsip
            OutgoingCallData.phoneNumber = OutgoingCallData.callee?.phones[0]
            makeCall()
            return
        }
        // If call type is SIP and phone number is available
        if OutgoingCallData.retry == false {
            close()
        }
//        }

        
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
    OutgoingCallData.callType = CallLogType.outgoing_CALL_NO_ANSWER // Reset state
    OutgoingCallData.callee = nil
    OutgoingCallData.callTime = nil
    OutgoingCallData.callConnected = false
    OutgoingCallData.retry = false
}

func close(){
    
    if let callee = OutgoingCallData.callee, let callTime = OutgoingCallData.callTime{
        let callDuration =  Int(Date().timeIntervalSince(callTime))
        CallLogDbHelper.addCallLog(
            callee, callTime: callTime, callDuration: callDuration, callType: OutgoingCallData.callType
        )
    }
    
    resetOutgoingCallData()
    OutgoingCallData.controller?.dismiss(animated: true, completion: nil)
}

func normalizePhone(_ phone: String) -> String{
    var resultPhone = phone.replacingOccurrences(of: "(02)", with:"02")
    resultPhone = resultPhone.replacingOccurrences(of: "+886", with: "0")
    resultPhone = resultPhone.replacingOccurrences(of: "(886)", with: "0")
    resultPhone = resultPhone.replacingOccurrences(of: "886", with: "0")
    return resultPhone
}

func makeCall(){
    switch OutgoingCallData.phoneType! {
        
    case CallPhoneType.sip:
        OutgoingCallData.sipIcon!.isHidden = false
        OutgoingCallData.statusLabel!.text = "SIP Dialing..."
        
    case CallPhoneType.nonsip:
        OutgoingCallData.sipIcon!.isHidden = true
        if let phoneNumber = OutgoingCallData.phoneNumber{
            OutgoingCallData.statusLabel!.text = "Dialing to \(phoneNumber)..."
        }
        
    case CallPhoneType.call_END:
        OutgoingCallData.statusLabel!.text = "Call end"
    }
    
    if let phone = OutgoingCallData.phoneNumber {
        if let lc = theLinphone.lc {
            linphone_core_invite(lc, normalizePhone(phone))
        }
        
        if OutgoingCallData.phoneType == CallPhoneType.sip {
            // Fire a timer to auto call mobile if not connect
            OutgoingCallController.addEndSipCallTimer()
        }
    }
}

class OutgoingCallController: UIViewController{
    
    var phoneNumber: String?
    var calleeName: String?
    var phoneType: CallPhoneType = .sip
    var calleeID: NSManagedObjectID?
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var statusLabel: UILabel!
    @IBOutlet var sipIcon: UIImageView!
    @IBOutlet var avatarImage: UIImageView!
    
    override func viewDidLoad() {
        NSLog("OutgoingCallController.viewDidLoad()")
        
        resetOutgoingCallData()
        
        OutgoingCallData.controller = self
        OutgoingCallData.callTime = Date()
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
        if OutgoingCallData.callee?.type == ContactType.company.hashValue{
            showAvatar(OutgoingCallData.phoneNumber!)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        OutgoingCallVT.lct.call_state_changed = outgoingCallStateChanged
        linphone_core_add_listener(theLinphone.lc!,  &OutgoingCallVT.lct)
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        linphone_core_remove_listener(theLinphone.lc!, &OutgoingCallVT.lct)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func hangUp(){
        OutgoingCallData.phoneType = CallPhoneType.call_END
        
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
    
    func showAvatar(_ phone: String){
        if let contact = ContactDbHelper.getContactBySip(phone){
            if contact.type == ContactType.company.hashValue {
                let url = URL(string: String(format: MicrosoftGraphApi.userPhotoURL, contact.email!))
                let request = NSMutableURLRequest(url: url!)
                
                let authentication: Authentication = Authentication()
                MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
                authentication.authenticationProvider?.appendAuthenticationHeaders(request, completion: { (request, error) in
                    
                    let token = request.value(forHTTPHeaderField: "Authorization")!
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
        Timer.scheduledTimer(
            timeInterval: 11, target: OutgoingCallController.self, selector: #selector(callPhoneIfSipNotConnect), userInfo: nil, repeats: false)
    }
    
    @objc static func callPhoneIfSipNotConnect(){
        if OutgoingCallData.callConnected == false &&
            OutgoingCallData.phoneType == CallPhoneType.sip
            && OutgoingCallData.callee?.phones.count != 0{
            
            OutgoingCallData.retry = true
            
            let call = linphone_core_get_current_call(theLinphone.lc!)
            if call != nil {
                let result = linphone_core_terminate_call(theLinphone.lc!, call)
                NSLog("Terminated call result(outgoing): \(result)")
            }
            
            OutgoingCallData.phoneType = CallPhoneType.nonsip
            OutgoingCallData.phoneNumber = OutgoingCallData.callee?.phones[0]
            makeCall()
            return
        }
    }
}
