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

    override var prefersStatusBarHidden : Bool {
        return true
    }
    
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    @IBAction func login(){
        authenticate()
    }
    
    @IBAction func prepareForUnwind(_ segue: UIStoryboardSegue){
        
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
                case .nsErrorType(let nsError):
                    print("Error:", nsError.localizedDescription)
                    // self.showError(message: "Login failed, please try it again later")
                }
            }
            else {
                NSLog("Login successful")
                self.performSegue(withIdentifier: "login", sender: nil)
            }
        }
    }
}

// MARK: UI Helper
private extension LoginController {
    func loadingUI(show: Bool) {
        if show {
            self.activityIndicator.startAnimating()
            self.connectButton.setTitle("Login...", for: UIControlState())
            self.connectButton.isEnabled = false;
        }
        else {
            self.activityIndicator.stopAnimating()
            self.connectButton.setTitle("Login", for: UIControlState())
            self.connectButton.isEnabled = true;
        }
    }
    
    func showError(message:String) {
        DispatchQueue.main.async(execute: {
            let alertControl = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
            alertControl.addAction(UIAlertAction(title: "Close", style: .default, handler: nil))
            
            self.present(alertControl, animated: true, completion: nil)
        })
    }
}
