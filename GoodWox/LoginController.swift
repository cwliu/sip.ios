import UIKit

class LoginController: UIViewController {

    let authentication: Authentication = Authentication()
    @IBOutlet var activityIndicator: UIActivityIndicatorView!
    @IBOutlet var connectButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        setNeedsStatusBarAppearanceUpdate()
    }

    override func prefersStatusBarHidden() -> Bool {
        return true
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    @IBAction func login(){
        authenticate()
    }
}

// MARK: Authentication
private extension LoginController {
    func authenticate() {
         loadingUI(show: true)
        
        let clientId = ApplicationConstants.clientId
        let scopes = ApplicationConstants.scopes
        
        authentication.connectToGraph(withClientId: clientId, scopes: scopes) {
            (error) in
            
            defer {self.loadingUI(show: false)}
            
            if let graphError = error {
                NSLog("Login failed")
                switch graphError {
                case .NSErrorType(let nsError):
                    print("Error:", nsError.localizedDescription)
                    // self.showError(message: "Login failed, please try it again later")
                }
            }
            else {
                NSLog("Login successful")
                self.performSegueWithIdentifier("login", sender: nil)
            }
        }
    }
}

// MARK: UI Helper
private extension LoginController {
    func loadingUI(show show: Bool) {
        if show {
            self.activityIndicator.startAnimating()
            self.connectButton.setTitle("Login...", forState: .Normal)
            self.connectButton.enabled = false;
        }
        else {
            self.activityIndicator.stopAnimating()
            self.connectButton.setTitle("Login", forState: .Normal)
            self.connectButton.enabled = true;
        }
    }
    
    func showError(message message:String) {
        dispatch_async(dispatch_get_main_queue(),{
            let alertControl = UIAlertController(title: "Error", message: message, preferredStyle: .Alert)
            alertControl.addAction(UIAlertAction(title: "Close", style: .Default, handler: nil))
            
            self.presentViewController(alertControl, animated: true, completion: nil)
        })
    }
}
