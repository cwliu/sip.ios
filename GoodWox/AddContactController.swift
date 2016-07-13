import Foundation
import Alamofire

extension UITextField {
    
    func useUnderline() {
        
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor(colorLiteralRed: 201/255, green: 196/255, blue: 194/255, alpha: 1).CGColor
        border.frame = CGRectMake(0, self.frame.size.height - borderWidth, self.frame.size.width, self.frame.size.height)
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

extension UIView
{
    func copyView() -> AnyObject
    {
        return NSKeyedUnarchiver.unarchiveObjectWithData(NSKeyedArchiver.archivedDataWithRootObject(self))!
    }
}


class AddContactController: UIViewController {
    
    @IBOutlet var nameTextfield: UITextField!
    
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var addPhoneButton: UIButton!
    @IBOutlet var lastPhoneTextField: UITextField!
    
    var currentPhoneFieldPosition: Int = 250
    let PHONE_FIELD_HEIGHT: Int = 46
    var phoneFieldList = [UITextField]()
    var deletePhoneFieldList = [UIButton]()
    
    var MAX_PHONE_FIELD = 7
    
    var nameString: String?
    var phoneList = [String]()
    
    var jsonObject: [String: AnyObject] = [:]
    
    override func viewDidLoad() {
        let rightSaveBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "完成", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AddContactController.saveClick))
        
        let leftCancelBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AddContactController.cancelClick))
        
        leftCancelBarButtonItem.width = -16
        rightSaveBarButtonItem.width = -16
        
        self.navigationItem.setRightBarButtonItem(rightSaveBarButtonItem, animated: true)
        self.navigationItem.setLeftBarButtonItem(leftCancelBarButtonItem, animated: true)
        self.navigationItem.hidesBackButton = true
        self.title = "新增連絡人"
        
        nameTextfield.useUnderline()
        phoneTextField.useUnderline()
        lastPhoneTextField = phoneTextField
        
        nameTextfield.text = nameString
        if phoneList.count > 0 {
            phoneTextField.text = phoneList[0]
        }
        
        if phoneList.count > 1 {
            for i in 1 ..< phoneList.count {
                addPhone(phoneList[i])
                if phoneFieldList.count > 6 {
                    break
                }
            }
        }
        
    }
    
    func saveClick(sender: UIButton){
        NSLog("Save click")
        
        let name = nameTextfield?.text
        if name == "" {
            let alert = UIAlertController(title: nil, message: "姓名不得為空", preferredStyle: .Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            let cancelAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(cancelAction)
            return
        }
        
        var phoneList = [String]()
        
        if let phone = phoneTextField.text where phone != ""{
            phoneList.append(phone)
        }
        
        for phoneField in phoneFieldList{
            if let phoneText = phoneField.text where phoneText != ""{
                phoneList.append(phoneText)
            }
        }
        
        if phoneList.count == 0 {
            let alert = UIAlertController(title: nil, message: "電話至少輸入一筆", preferredStyle: .Alert)
            self.presentViewController(alert, animated: true, completion: nil)
            let cancelAction = UIAlertAction(title: "OK", style: .Default, handler: nil)
            alert.addAction(cancelAction)
            return
        }
        
        // Save contact
        ContactDbHelper.addContect(name!, phoneList: phoneList, type: ContactType.MANUAL)
        
        // Save contact to backend
        saveContactToBackend(name!, phoneList: phoneList)
        
         getBizSocialRecommendation(phoneList)
        
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func cancelClick(sender: UIButton){
        NSLog("Cancel click")
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func addNewPhoneField(){
        addPhone(nil)
    }
    
    func addPhone(phoneNumber: String?){
        // Add phone delte button
        let deletePhoneFieldButton = UIButton()
        deletePhoneFieldButton.frame = CGRectMake( 16, CGFloat(currentPhoneFieldPosition + 10 + PHONE_FIELD_HEIGHT * Int(phoneFieldList.count)), 20, 20)
        deletePhoneFieldButton.tag = phoneFieldList.count
        deletePhoneFieldButton.setImage(UIImage(named: "minus_red_20dp"), forState: UIControlState.Normal)
        deletePhoneFieldButton.addTarget(self, action: #selector(AddContactController.deletePhoneField(_:)), forControlEvents: .TouchUpInside)
        
        self.view.insertSubview(deletePhoneFieldButton, belowSubview: lastPhoneTextField)
        
        deletePhoneFieldList.append(deletePhoneFieldButton)
        
        // Add a new UITextField
        let newPhoneTextField = UITextField(
            frame: CGRectMake(44, CGFloat(currentPhoneFieldPosition + PHONE_FIELD_HEIGHT * Int(phoneFieldList.count)), 315, 38)
        )
        
        newPhoneTextField.borderStyle = .RoundedRect
        newPhoneTextField.borderStyle = UITextBorderStyle.None
        newPhoneTextField.placeholder = "電話"
        newPhoneTextField.keyboardType = .PhonePad
        newPhoneTextField.useUnderline()
        newPhoneTextField.tag = phoneFieldList.count
        
        if let number = phoneNumber {
            newPhoneTextField.text = number
        }
        
        phoneFieldList.append(newPhoneTextField)
        
        self.view.insertSubview(newPhoneTextField, belowSubview: lastPhoneTextField)
        lastPhoneTextField = newPhoneTextField
        
        if(phoneFieldList.count > MAX_PHONE_FIELD){
            addPhoneButton.hidden = true
        }
    }
    
    func deletePhoneField(button: UIButton){
        let tag = button.tag
        let phoneField = phoneFieldList[tag]
        phoneField.removeFromSuperview()
        button.removeFromSuperview()
        
        phoneFieldList.removeAtIndex(tag)
        deletePhoneFieldList.removeAtIndex(tag)
        
        for index in tag..<phoneFieldList.count{
            let phoneField = phoneFieldList[index]
            phoneField.frame = CGRectOffset(phoneField.frame, 0, -46);
            
            let deleteButton = deletePhoneFieldList[index]
            deleteButton.frame = CGRectOffset(deleteButton.frame, 0, -46);
            
        }
        
        // Reset index
        for index in 0..<phoneFieldList.count{
            phoneFieldList[index].tag = index
            deletePhoneFieldList[index].tag = index
        }
        
        if(phoneFieldList.count <= MAX_PHONE_FIELD){
            addPhoneButton.hidden = false
        }
    }
    
    func saveContactToBackend(name: String, phoneList: [String]){
        
        let request = NSMutableURLRequest(URL: NSURL(string: SipServerBackend.contactURL)!)
        request.HTTPMethod = "POST"
        
        do {
            let phoneListJson = try NSJSONSerialization.dataWithJSONObject(phoneList, options: NSJSONWritingOptions.PrettyPrinted)
            
            let parameters: [String: String] = [
                "email": UserData.getGraphAccount()!,
                "backend_access_token": UserData.getBackendAccessToken()!,
                "contact_name": name,
                "contact_phone_list": NSString(data: phoneListJson, encoding: NSUTF8StringEncoding)! as String
            ]
            
            Alamofire.request(.POST, request, parameters: parameters).responseJSON { response in
                
                
                switch response.result {
                case .Success:
                    NSLog("response.request: \(response.request)")  // original URL request
                    NSLog("esponse.response: \(response.response)") // URL response
                    NSLog("Validation Successful")
                    
                case .Failure(let error):
                    // Logout
                    NSLog("\(error), \(String(data: response.data!, encoding: NSUTF8StringEncoding))")
                    UserData.clear()
                    return
                }
            }
        }catch let error as NSError{
            NSLog(error.description)
            return
        }
    }
    
    func getBizSocialRecommendation(phoneList: [String]){
        if phoneList.count == 0 {
            return
        }
        
        let phoneListString = phoneList.map{String($0)}.joinWithSeparator(",")
        
        let parameters: [String: String] = [
            "email": UserData.getGraphAccount()!,
            "backend_access_token": UserData.getBackendAccessToken()!,
            "phone_list": phoneListString,
            ]
        
        let request = NSMutableURLRequest(URL: NSURL(string: SipServerBackend.bizSocalURL)!)
        
        Alamofire.request(.GET, request, parameters:  parameters).responseJSON { response in
            
            
            switch response.result {
            case .Success:
                NSLog("Successful")
                NSLog("response.request: \(response.request)")  // original URL request
                NSLog("esponse.response: \(response.response)") // URL response
                
                if let j = response.result.value{
                    self.jsonObject = j as! [String : AnyObject]
                }
                
                let user_list = self.jsonObject["recommend_list"] as! NSArray
                if user_list.count == 0{
                    return
                }
                
                if var controller = UIApplication.sharedApplication().keyWindow?.rootViewController {
                    while let presentedViewController = controller.presentedViewController {
                        controller = presentedViewController
                    }
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewControllerWithIdentifier("recommend") as! UINavigationController
                    
                    let rc = vc.topViewController as! RecommendController
                    rc.jsonObject = self.jsonObject
                    
                    controller.presentViewController(vc, animated: true, completion: nil)
                }
                
            case .Failure(let error):
                NSLog("Error: \(error)")
                return
            }
        }
    }
}
