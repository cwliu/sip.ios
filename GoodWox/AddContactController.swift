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
    
    @IBOutlet var firstnameTextfield: UITextField!
    @IBOutlet var lastnameTextfield: UITextField!
    
    @IBOutlet var phoneTextField: UITextField!
    @IBOutlet var addPhoneButton: UIButton!
    @IBOutlet var lastPhoneTextField: UITextField!
    
    var currentPhoneFieldPosition: Int = 250
    let PHONE_FIELD_HEIGHT: Int = 46
    var phoneFieldList = [UITextField]()
    var deletePhoneFieldList = [UIButton]()
    
    var MAX_PHONE_FIELD = 7
    
    override func viewDidLoad() {
        let rightSaveBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "完成", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AddContactController.saveClick))
        
        let leftCancelBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AddContactController.cancelClick))
        
        leftCancelBarButtonItem.width = -16
        rightSaveBarButtonItem.width = -16
        
        self.navigationItem.setRightBarButtonItem(rightSaveBarButtonItem, animated: true)
        self.navigationItem.setLeftBarButtonItem(leftCancelBarButtonItem, animated: true)
        self.navigationItem.hidesBackButton = true
        self.title = "新增連絡人"
        
        firstnameTextfield.useUnderline()
        lastnameTextfield.useUnderline()
        phoneTextField.useUnderline()
        lastPhoneTextField = phoneTextField
        
    }
    
    func saveClick(sender: UIButton){
        NSLog("Save click")
        
        let name = firstnameTextfield.text! + lastnameTextfield.text!
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
        ContactDbHelper.addContect(name, phoneList: phoneList, type: ContactType.MANUAL)
        
        // Save contact to backend
        saveContactToBackend(name, phoneList: phoneList)
        navigationController?.popViewControllerAnimated(true)
    }
    
    func cancelClick(sender: UIButton){
        NSLog("Cancel click")
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    @IBAction func addNewPhoneField(){
        
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
        newPhoneTextField.useUnderline()
        newPhoneTextField.tag = phoneFieldList.count
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
                
                NSLog("response.request: \(response.request)")  // original URL request
                NSLog("esponse.response: \(response.response)") // URL response
                
                switch response.result {
                case .Success:
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
}
