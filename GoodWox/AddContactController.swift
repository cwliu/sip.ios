import Foundation

class AddContactController: UIViewController {

    override func viewDidLoad() {
        let rightSaveBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "完成", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AddContactController.saveClick))

        let leftCancelBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(AddContactController.cancelClick))

        leftCancelBarButtonItem.width = -16
        rightSaveBarButtonItem.width = -16
        
        self.navigationItem.setRightBarButtonItem(rightSaveBarButtonItem, animated: true)
        self.navigationItem.setLeftBarButtonItem(leftCancelBarButtonItem, animated: true)
        self.navigationItem.hidesBackButton = true
        self.title = "新增連絡人"
        
    }
    
    func saveClick(sender: UIButton){
        NSLog("Save click")
        
        navigationController?.popViewControllerAnimated(true)
    }

    func cancelClick(sender: UIButton){
        NSLog("Cancel click")
        
        navigationController?.popViewControllerAnimated(true)
        
    }
}
