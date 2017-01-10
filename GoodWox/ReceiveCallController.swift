import Foundation

struct ReceiveCallData{
    static var controller: ReceiveCallController?
    static var callee: Contact?
    static var callTime: Date?
    static var callType: CallLogType = CallLogType.incoming_CALL_NO_ANSWER
}

struct ReceiveCallVT {
    static var lct: LinphoneCoreVTable = LinphoneCoreVTable()
}

var receiveCallStateChanged: LinphoneCoreCallStateChangedCb = {
    (lc: OpaquePointer, call: OpaquePointer, callSate: LinphoneCallState,  message) in
    
    switch callSate{
    case LinphoneCallConnected: /**<The call encountered an error*/
        NSLog("receiveCallStateChanged: LinphoneCallConnected")
        ReceiveCallData.controller?.statusLabel.text = "Connected"
        ReceiveCallData.controller?.showEndButton()
        ReceiveCallData.callType = CallLogType.incoming_CALL_ANSWERED
        
    case LinphoneCallError: /**<The call encountered an error*/
        NSLog("receiveCallStateChanged: LinphoneCallError")
        finish()
        
    case LinphoneCallEnd:
        NSLog("receiveCallStateChanged: LinphoneCallEnd")
        finish()
        
    default:
        NSLog("receiveCallStateChanged: Default call state")
    }
}


func finish(){
    let call = linphone_core_get_current_call(theLinphone.lc!)
    if call != nil {
        let result = linphone_core_terminate_call(theLinphone.lc!, call)
        NSLog("Terminated call result(receive): \(result)")
    }
    
    if let callee = ReceiveCallData.callee, let callTime = ReceiveCallData.callTime {
        let callDuration =  Int(Date().timeIntervalSince(callTime))
        CallLogDbHelper.addCallLog(callee, callTime: callTime, callDuration: callDuration, callType: ReceiveCallData.callType)
    }
    
    resetReceiveCallData()
    ReceiveCallData.controller?.dismiss(animated: false, completion: nil)
}

func resetReceiveCallData(){
    ReceiveCallData.callType = CallLogType.incoming_CALL_NO_ANSWER // Reset state
    ReceiveCallData.callTime = nil
    ReceiveCallData.callee = nil
}

class ReceiveCallController: UIViewController{
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var statusLabel: UILabel!
    
    @IBOutlet var acceptButton: UIButton!
    @IBOutlet var declineButton: UIButton!
    @IBOutlet var endButton: UIButton!
    
    override func viewDidLoad() {
        NSLog("ReceiveCallController.viewDidLoad()")
        
        endButton.isHidden = true
        ReceiveCallData.controller = self
        ReceiveCallData.callTime = Date()
        
        self.navigationItem.hidesBackButton = true
        
        let call = linphone_core_get_current_call(theLinphone.lc!)
        let address = linphone_call_get_remote_address_as_string(call)
        let account = getUsernameFromAddress(String(cString: address))

        nameLabel.text = account
        if let contact = ContactDbHelper.getContactBySip(account){
            ReceiveCallData.callee = contact
            
            nameLabel.text = contact.name
            
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("ReceiveCallController.prepareForSegue()")
    }
    
    @IBAction func endCall(){
        let call = linphone_core_get_current_call(theLinphone.lc!)
        if call != nil {
            if ReceiveCallData.callType == .incoming_CALL_NO_ANSWER{
                linphone_core_decline_call(theLinphone.lc!, call, LinphoneReasonDeclined)
            }else{
                linphone_core_terminate_call(theLinphone.lc!, call)
            }
        }
    }
    
    @IBAction func answerCall(){
        let call = linphone_core_get_current_call(theLinphone.lc!)
        if call != nil {
            linphone_core_accept_call(theLinphone.lc!, call)
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        NSLog("viewWillAppear: ")
        ReceiveCallVT.lct.call_state_changed = receiveCallStateChanged
        linphone_core_add_listener(theLinphone.lc!,  &ReceiveCallVT.lct)
    }
    
    
    override func viewDidDisappear(_ animated: Bool) {
        NSLog("viewDidDisappear: ")
        linphone_core_remove_listener(theLinphone.lc!, &ReceiveCallVT.lct)
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    func showEndButton(){
        acceptButton.isHidden = true
        declineButton.isHidden = true
        endButton.isHidden = false
    }
}


