import Foundation


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
        
        //
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
        
        // addPhoneButton.frame = CGRectOffset(addPhoneButton.frame, 0, 48);
        
        self.view.insertSubview(newPhoneTextField, belowSubview: lastPhoneTextField)
        lastPhoneTextField = newPhoneTextField
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
    }
}
