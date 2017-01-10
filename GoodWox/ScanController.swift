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
        
        
        let leftCancelBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "取消", style: UIBarButtonItemStyle.plain, target: self, action: #selector(ScanController.cancelClick))
        
        self.navigationItem.setLeftBarButton(leftCancelBarButtonItem, animated: true)
        self.navigationItem.hidesBackButton = true
    }
    
    override func viewWillAppear(_ animated: Bool) {
        takePicture()
    }
    
    func takePicture() {
        let imagePicker = UIImagePickerController()
        if UIImagePickerController.isSourceTypeAvailable(.camera){
            imagePicker.sourceType = .camera
        }else{
            imagePicker.sourceType = .photoLibrary
        }
        imagePicker.delegate = self
        
        // Place image picker on the screen
        loadingUI(show: true)
        present(imagePicker, animated: true, completion: nil)
    }
    
    func resizeImage(_ image: UIImage, newWidth: CGFloat) -> UIImage {
        
        let scale = newWidth / image.size.width
        let newHeight = image.size.height * scale
        UIGraphicsBeginImageContext(CGSize(width: newWidth, height: newHeight))
        image.draw(in: CGRect(x: 0, y: 0, width: newWidth, height: newHeight))
        let newImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        return newImage!
    }
    
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        let image = info[UIImagePickerControllerOriginalImage] as! UIImage
        
        imageView.image = image
        
        dismiss(animated: true, completion: nil)
        
        
        let path = Bundle.main.path(forResource: "Secret", ofType: "plist")
        let dict = NSDictionary(contentsOfFile: path!)
        let bcrPass = dict?.object(forKey: "bcrPass") as! String
        let bcrUser = dict?.object(forKey: "bcrUser") as! String
        
        let url = URL(string: String(format: BcrServer.bcrServiceUrl, bcrUser, bcrPass))!

        let resizedImage = resizeImage(imageView.image!, newWidth: 1024)
        
        Alamofire.upload(.POST, url, multipartFormData: { multipartFormData in
            if let imageData = UIImageJPEGRepresentation(resizedImage, 70) {
                multipartFormData.appendBodyPart(
                    data: imageData, name: "user_image", fileName: "file.jpg", mimeType: "image/jpg")
            }
            }, encodingCompletion: { encodingResult in
                
                switch encodingResult {
                case .success(let upload, _, _):
                    upload.responseString(queue: nil, encoding: String.Encoding.utf8) { response in
                        NSLog(response.debugDescription)
                    
                        if let statusCode = response.response?.statusCode {
                            if statusCode >= 400{
                                self.retake()
                                return
                            }
                            
                            do {
                                let vcardString = response.result.value!
                                let vcardNSData = vcardString.data(using: String.Encoding.utf8)!
                                let contacts =  try CNContactVCardSerialization.contacts(with: vcardNSData)
                                
                                if contacts.count <= 0{
                                    self.retake()
                                    return
                                }
                                
                                let targetContact = contacts[0] as! CNContact
                                
                                self.contactName = CNContactFormatter.string(from: targetContact, style: .fullName) ?? "No Name"
                                
                                for phone in (contacts[0]).phoneNumbers{
                                    self.phoneList.append((phone.value as! CNPhoneNumber).value(forKey: "digits") as! String)
                                }
                                
                                NSLog("Parsed contact name: \(self.contactName), \(self.phoneList.debugDescription)")
                                
                                self.performSegue(withIdentifier: "addContact", sender: nil)
                                
                                
                            } catch let error {
                                NSLog("Parse error: \(error)")
                            }
                        }
                        
                    }
                    
                case .failure(let encodingError):
                    self.retake()
                    print(encodingError)
                }
            }
        )
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController){
        navigationController?.popViewController(animated: true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        NSLog("prepareForSegue: \(segue.identifier)")
        
        if(segue.identifier == "addContact"){
            let controller = segue.destination as! AddContactController
            controller.nameString = contactName
            for phone in phoneList{
                controller.phoneList.append(phone)
            }
        }
    }
    
    func cancelClick(_ sender: UIButton){
        NSLog("Cancel click")
        
        navigationController?.popViewController(animated: true)
    }
    
    func retake(){
        
        let alert = UIAlertController(title: nil, message: "辨識失敗", preferredStyle: .alert)
        let cancelAction = UIAlertAction(title: "OK", style: .default, handler: {(alert: UIAlertAction!) in self.takePicture()})
        alert.addAction(cancelAction)
        self.present(alert, animated: true, completion: nil)
    }
}

private extension ScanController {
    func loadingUI(show: Bool) {
        if show {
            self.activityIndicator.startAnimating()
        }
        else {
            self.activityIndicator.stopAnimating()
        }
    }
}
