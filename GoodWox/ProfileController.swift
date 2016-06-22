import Foundation
import UIKit

class ProfileController: UIViewController{
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var avatarImage: UIImageView!
    
    
    let authentication: Authentication = Authentication()
    
    lazy var graphClient: MSGraphClient = {
        let client = MSGraphClient.defaultClient()
        return client
    }()
    
    override func viewDidLoad(){
        
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
        //        self.getMeInfo()
        
        self.nameLabel.text = UserData.getGraphName()
        
        self.avatarImage.imageFromUrl(MicrosoftGraphApi.myPhoneURL)
        self.avatarImage.layer.cornerRadius = 60
        self.avatarImage.clipsToBounds = true
        
        self.navigationController?.navigationBar.barStyle = .Black
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return .LightContent
    }
    
}

// MARK: Actions
private extension ProfileController{
    @IBAction func logout(sender: AnyObject){
        
        let logoutConfirmMenu = UIAlertController(title: nil, message: "確定要登出嗎？", preferredStyle:  .Alert)
        
        let cancelAction = UIAlertAction(title: "取消", style: .Cancel, handler: nil)
        let okAction = UIAlertAction(title: "確認", style: .Default, handler: {
            (action: UIAlertAction) -> Void in
            self.disconnect()
        })
        
        logoutConfirmMenu.addAction(cancelAction)
        logoutConfirmMenu.addAction(okAction)
        
        self.presentViewController(logoutConfirmMenu, animated: true, completion: nil)
    }
    
    @IBAction func information(sender: AnyObject){
        
        let versionNumber = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleShortVersionString") as! String
        let buildNumber = NSBundle.mainBundle().objectForInfoDictionaryKey("CFBundleVersion") as! String

        
        let versionAndBuildNumber: String = "\(versionNumber) (\(buildNumber))"

        let infoDialog = UIAlertController(title: nil, message: "版本: \(versionAndBuildNumber)", preferredStyle:  .Alert)        
        let okAction = UIAlertAction(title: "關閉", style: .Default, handler: nil)
        
        infoDialog.addAction(okAction)

        self.presentViewController(infoDialog, animated: true, completion: nil)
    }
}

// MARK: Graph Helper
private extension ProfileController{
    func disconnect(){
        
        // Graph logout
        authentication.disconnect()
        
        UserData.clear()
        
        // Delete DB
        ContactDbHelper.deleteAll()
        
        // linphone unregister
        LinphoneManager.unregister()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewControllerWithIdentifier("LoginController") as! LoginController
        self.presentViewController(vc, animated: true, completion: nil)        
    }
}

extension UIImageView {
    public func imageFromUrl(urlString: String) {
        if let url = NSURL(string: urlString) {
            let request = NSMutableURLRequest(URL: url)
            request.setValue("Bearer " + UserData.getGraphAccessToken()!, forHTTPHeaderField: "Authorization")
            NSURLSession.sharedSession().dataTaskWithRequest(request) {
                (data, response, error) in
                guard let data = data where error == nil else{
                    NSLog("Image download error: \(error)")
                    return
                }
                
                if let httpResponse = response as? NSHTTPURLResponse{
                    if httpResponse.statusCode > 400 {
                        let errorMsg = NSString(data: data, encoding: NSUTF8StringEncoding)
                        NSLog("Image download error, statusCode: \(httpResponse.statusCode), error: \(errorMsg!)")
                        return
                    }
                }
                
                dispatch_async(dispatch_get_main_queue(), {
                    NSLog("Image download success")
                    self.image = UIImage(data: data)
                })

            }.resume()
        }
    }
}