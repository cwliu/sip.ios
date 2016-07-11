import Foundation
import Alamofire
import Contacts

class ScanController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    
    var imageView: UIImageView!
    
    var contactName: String!
    var phoneList = [String]()
    
    @IBOutlet var activityIndicator: UIActivityIndicatorView!

    override func viewDidLoad() {
        NSLog("ViewDidLoad()")
        
        imageView = UIImageView()
        
        
        let leftCancelBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(ScanController.cancelClick))
        
        self.navigationItem.setLeftBarButtonItem(leftCancelBarButtonItem, animated: true)
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(animated: Bool) {
        takePicture()
    }
    
    func takePicture() {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.Camera){
            imagePicker.sourceType = .Camera
        }else{
            imagePicker.sourceType = .PhotoLibrary
        }
        imagePicker.delegate = self
        
        // Place image picker on the screen
        loadingUI(show: true)
        presentViewController(imagePicker, animated: true, completion: nil)
    }
    
    func resizeImage(image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSizeMake(newWidth, newHeight))
        image.drawInRect(CGRectMake(0, 0, newWidth, newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : AnyObject]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        
        dismissViewControllerAnimated(true, completion: nil)
        
        
        let path = NSBundle.mainBundle().pathForResource("Secret", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        let bcrPass = dict?.objectForKey("bcrPass") as! String
        let bcrUser = dict?.objectForKey("bcrUser") as! String
        
        let url = NSURL(string: String(format: BcrServer.bcrServiceUrl, bcrUser, bcrPass))!

        let resizedImage = resizeImage(imageView.image!, newWidth: 1024)
        
        Alamofire.upload(.POST, url, multipartFormData: { multipartFormData in
            if let imageData = UIImageJPEGRepresentation(resizedImage, 70) {
                multipartFormData.appendBodyPart(
                    data: imageData, name: "user_image", fileName: "file.jpg", mimeType: "image/jpg")
            }
            }, encodingCompletion: { encodingResult in
                
                switch encodingResult {
                case .Success(let upload, _, _):
                    upload.responseString(queue: nil, encoding: NSUTF8StringEncoding) { response in
                        NSLog(response.debugDescription)
                    
                        if let statusCode = response.response?.statusCode {
                            if statusCode >= 400{
                                self.retake()
                                return
                            }
                            
                            do {
                                let vcardString = response.result.value!
                                let vcardNSData = vcardString.dataUsingEncoding(NSUTF8StringEncoding)!
                                let contacts =  try CNContactVCardSerialization.contactsWithData(vcardNSData)
                                
                                if contacts.count <= 0{
                                    self.retake()
                                    return
                                }
                                
                                let targetContact = contacts[0] as! CNContact
                                
                                self.contactName = CNContactFormatter.stringFromContact(targetContact, style: .FullName) ?? "No Name"
                                
                                for phone in (contacts[0]).phoneNumbers{
                                    self.phoneList.append((phone.value as! CNPhoneNumber).valueForKey("digits") as! String)
                                }
                                
                                NSLog("Parsed contact name: \(self.contactName), \(self.phoneList.debugDescription)")
                                
                                self.performSegueWithIdentifier("addContact", sender: nil)
                                
                                
                            } catch let error {
                                NSLog("Parse error: \(error)")
                            }
                        }
                        
                    }
                    
                case .Failure(let encodingError):
                    self.retake()
                    print(encodingError)
                }
            }
        )
    }
    
    func imagePickerControllerDidCancel(picker: UIImagePickerController){
        navigationController?.popViewControllerAnimated(true)
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        NSLog("prepareForSegue: \(segue.identifier)")
        
        if(segue.identifier == "addContact"){
            let controller = segue.destinationViewController as! AddContactController
            controller.nameString = contactName
            for phone in phoneList{
                controller.phoneList.append(phone)
            }
        }
    }
    
    func cancelClick(sender: UIButton){
        NSLog("Cancel click")
        
        navigationController?.popViewControllerAnimated(true)
    }
    
    func retake(){
        
        let alert = UIAlertController(title: nil, message: "辨識失敗", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title: "OK", style: .Default, handler: {(alert: UIAlertAction!) in self.takePicture()})
        alert.addAction(cancelAction)
        self.presentViewController(alert, animated: true, completion: nil)
    }
}

private extension ScanController {
    func loadingUI(show show: Bool) {
        if show {
            self.activityIndicator.startAnimating()
        }
        else {
            self.activityIndicator.stopAnimating()
        }
    }
}
