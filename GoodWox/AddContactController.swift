import Foundation
import Alamofire

extension UITextField {
    
    func useUnderline() {
        
        let border = CALayer()
        let borderWidth = CGFloat(1.0)
        border.borderColor = UIColor(colorLiteralRed: 201/255, green: 196/255, blue: 194/255, alpha: 1).cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - borderWidth, width: self.frame.size.width, height: self.frame.size.height)
        border.borderWidth = borderWidth
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}

extension UIView
{
    func copyView() -> AnyObject
    {
        return NSKeyedUnarchiver.unarchiveObject(with: NSKeyedArchiver.archivedData(withRootObject: self))! as AnyObject
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
        let rightSaveBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "完成", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddContactController.saveClick))
        
        let leftCancelBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(AddContactController.cancelClick))
        
        leftCancelBarButtonItem.width = -16
        rightSaveBarButtonItem.width = -16
        
        self.navigationItem.setRightBarButton(rightSaveBarButtonItem, animated: true)
        self.navigationItem.setLeftBarButton(leftCancelBarButtonItem, animated: true)
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
    
    func saveClick(_ sender: UIButton){
        NSLog("Save click")
        
        let name = nameTextfield?.text
        if name == "" {
            let alert = UIAlertController(title: nil, message: "姓名不得為空", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            let cancelAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(cancelAction)
            return
        }
        
        var phoneList = [String]()
        
        if let phone = phoneTextField.text, phone != ""{
            phoneList.append(phone)
        }
        
        for phoneField in phoneFieldList{
            if let phoneText = phoneField.text, phoneText != ""{
                phoneList.append(phoneText)
            }
        }
        
        if phoneList.count == 0 {
            let alert = UIAlertController(title: nil, message: "電話至少輸入一筆", preferredStyle: .alert)
            self.present(alert, animated: true, completion: nil)
            let cancelAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alert.addAction(cancelAction)
            return
        }
        
        // Save contact
        ContactDbHelper.addContect(name!, phoneList: phoneList, type: ContactType.manual)
        
        // Save contact to backend
        saveContactToBackend(name!, phoneList: phoneList)
        
        // Get biz social recommendation 
        getBizSocialRecommendation(phoneList)
        
        self.navigationController?.popViewController(animated: true)
    }
    
    func cancelClick(_ sender: UIButton){
        NSLog("Cancel click")
        
        navigationController?.popViewController(animated: true)
    }
    
    @IBAction func addNewPhoneField(){
        addPhone(nil)
    }
    
    func addPhone(_ phoneNumber: String?){
        // Add phone delte button
        let deletePhoneFieldButton = UIButton()
        deletePhoneFieldButton.frame = CGRect( x: 16, y: CGFloat(currentPhoneFieldPosition + 10 + PHONE_FIELD_HEIGHT * Int(phoneFieldList.count)), width: 20, height: 20)
        deletePhoneFieldButton.tag = phoneFieldList.count
        deletePhoneFieldButton.setImage(UIImage(named: "minus_red_20dp"), for: UIControlState())
        deletePhoneFieldButton.addTarget(self, action: #selector(AddContactController.deletePhoneField(_:)), for: .touchUpInside)
        
        self.view.insertSubview(deletePhoneFieldButton, belowSubview: lastPhoneTextField)
        
        deletePhoneFieldList.append(deletePhoneFieldButton)
        
        // Add a new UITextField
        let newPhoneTextField = UITextField(
            frame: CGRect(x: 44, y: CGFloat(currentPhoneFieldPosition + PHONE_FIELD_HEIGHT * Int(phoneFieldList.count)), width: 315, height: 38)
        )
        
        newPhoneTextField.borderStyle = .roundedRect
        newPhoneTextField.borderStyle = UITextBorderStyle.none
        newPhoneTextField.placeholder = "電話"
        newPhoneTextField.keyboardType = .phonePad
        newPhoneTextField.useUnderline()
        newPhoneTextField.tag = phoneFieldList.count
        
        if let number = phoneNumber {
            newPhoneTextField.text = number
        }
        
        phoneFieldList.append(newPhoneTextField)
        
        self.view.insertSubview(newPhoneTextField, belowSubview: lastPhoneTextField)
        lastPhoneTextField = newPhoneTextField
        
        if(phoneFieldList.count > MAX_PHONE_FIELD){
            addPhoneButton.isHidden = true
        }
    }
    
    func deletePhoneField(_ button: UIButton){
        let tag = button.tag
        let phoneField = phoneFieldList[tag]
        phoneField.removeFromSuperview()
        button.removeFromSuperview()
        
        phoneFieldList.remove(at: tag)
        deletePhoneFieldList.remove(at: tag)
        
        for index in tag..<phoneFieldList.count{
            let phoneField = phoneFieldList[index]
            phoneField.frame = phoneField.frame.offsetBy(dx: 0, dy: -46);
            
            let deleteButton = deletePhoneFieldList[index]
            deleteButton.frame = deleteButton.frame.offsetBy(dx: 0, dy: -46);
            
        }
        
        // Reset index
        for index in 0..<phoneFieldList.count{
            phoneFieldList[index].tag = index
            deletePhoneFieldList[index].tag = index
        }
        
        if(phoneFieldList.count <= MAX_PHONE_FIELD){
            addPhoneButton.isHidden = false
        }
    }
    
    func saveContactToBackend(_ name: String, phoneList: [String]){
        
        let request = NSMutableURLRequest(url: URL(string: SipServerBackend.contactURL)!)
        request.httpMethod = "POST"
        
        do {
            let phoneListJson = try JSONSerialization.data(withJSONObject: phoneList, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            let parameters: [String: String] = [
                "email": UserData.getGraphAccount()!,
                "backend_access_token": UserData.getBackendAccessToken()!,
                "contact_name": name,
                "contact_phone_list": NSString(data: phoneListJson, encoding: String.Encoding.utf8.rawValue)! as String
            ]
            
            Alamofire.request(.POST, request, parameters: parameters).responseJSON { response in
                
                
                switch response.result {
                case .success:
                    NSLog("Validation Successful")
                    
                case .failure(let error):
                    // Logout
                    NSLog("\(error), \(String(data: response.data!, encoding: String.Encoding.utf8))")
                    UserData.clear()
                    return
                }
            }
        }catch let error as NSError{
            NSLog(error.description)
            return
        }
    }
    
    func getBizSocialRecommendation(_ phoneList: [String]){
        if phoneList.count == 0 {
            return
        }
        
        let phoneListString = phoneList.map{String($0)}.joined(separator: ",")
        
        let parameters: [String: String] = [
            "email": UserData.getGraphAccount()!,
            "backend_access_token": UserData.getBackendAccessToken()!,
            "phone_list": phoneListString,
            ]
        
        let request = NSMutableURLRequest(url: URL(string: SipServerBackend.bizSocalURL)!)
        
        Alamofire.request(.GET, request, parameters:  parameters).responseJSON { response in
            
            
            switch response.result {
            case .success:
                NSLog("Successful")
                
                if let j = response.result.value{
                    self.jsonObject = j as! [String : AnyObject]
                }
                
                let user_list = self.jsonObject["recommend_list"] as! NSArray
                if user_list.count == 0{
                    return
                }
                
                if var controller = UIApplication.shared.keyWindow?.rootViewController {
                    while let presentedViewController = controller.presentedViewController {
                        controller = presentedViewController
                    }
                    
                    let storyboard = UIStoryboard(name: "Main", bundle: nil)
                    let vc = storyboard.instantiateViewController(withIdentifier: "recommend") as! UINavigationController
                    
                    let rc = vc.topViewController as! RecommendController
                    rc.jsonObject = self.jsonObject
                    rc.contactName = self.nameTextfield.text!
                    
                    controller.present(vc, animated: true, completion: nil)
                }
                
            case .failure(let error):
                NSLog("Error: \(error)")
                return
            }
        }
    }
}
