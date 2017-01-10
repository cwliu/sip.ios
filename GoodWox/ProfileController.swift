import Foundation
import UIKit
import Haneke


class ProfileController: UIViewController{
    
    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var avatarImage: UIImageView!
    @IBOutlet var statusImage: UIImageView!
    
    let authentication: Authentication = Authentication()
    
    lazy var graphClient: MSGraphClient = {
        let client = MSGraphClient.defaultClient()
        return client!
    }()
    
    override func viewDidLoad(){
        
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
        
        self.nameLabel.text = UserData.getGraphName()
        
        let url = URL(string: String(format: MicrosoftGraphApi.userPhotoURL, UserData.getGraphAccount()!))
        let request = NSMutableURLRequest(url: url!)        
  
        authentication.authenticationProvider?.appendAuthenticationHeaders(request, completion: { (request, error) in
            
            let token = request?.value(forHTTPHeaderField: "Authorization")!

            let fetcher = BearerHeaderNetworkFetcher<UIImage>(URL: url!, token: token)

            self.avatarImage.hnk_setImageFromFetcher(fetcher)
            self.avatarImage.layer.cornerRadius = 60
            self.avatarImage.clipsToBounds = true

        })
        
        self.navigationController?.navigationBar.barStyle = .black
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewWillAppear(_ animated: Bool) {
        switch sipRegistrationStatus {
        case .ok:
            NSLog("sipRegistrationStatus: OK")
            statusImage.image = UIImage(named: "check_circle_green_14dp")
            
        case .fail:
            NSLog("sipRegistrationStatus: FAIL")
            statusImage.image = UIImage(named: "cross_circle_red_14dp")
            
        case .unknown:
            NSLog("sipRegistrationStatus: UNKNOWN")
            statusImage.image = UIImage(named: "sync_circle_blue_14dp")
            
        }
    }
}

// MARK: Actions
private extension ProfileController{
    @IBAction func logout(_ sender: AnyObject){
        
        let logoutConfirmMenu = UIAlertController(title: nil, message: "確定要登出嗎？", preferredStyle:  .alert)
        
        let cancelAction = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        let okAction = UIAlertAction(title: "確認", style: .default, handler: {
            (action: UIAlertAction) -> Void in
            self.disconnect()
        })
        
        logoutConfirmMenu.addAction(cancelAction)
        logoutConfirmMenu.addAction(okAction)
        
        self.present(logoutConfirmMenu, animated: true, completion: nil)
    }
    
    @IBAction func information(_ sender: AnyObject){
        
        let versionNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as! String
        let buildNumber = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as! String
        
        
        let versionAndBuildNumber: String = "\(versionNumber) (\(buildNumber))"
        
        let infoDialog = UIAlertController(title: nil, message: "版本: \(versionAndBuildNumber)", preferredStyle:  .alert)
        let okAction = UIAlertAction(title: "關閉", style: .default, handler: nil)
        
        infoDialog.addAction(okAction)
        
        self.present(infoDialog, animated: true, completion: nil)
    }
}

// MARK: Graph Helper
private extension ProfileController{
    func disconnect(){
        
        // Graph logout
        authentication.disconnect()
        
        UserData.clear()
        
        Haneke.Shared.imageCache.removeAll()
        
        // Delete DB
        ContactDbHelper.deleteAll()
        
        // linphone unregister
        theLinphone.manager!.unregister()
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "LoginController") as! LoginController
        self.present(vc, animated: true, completion: nil)
    }
}
