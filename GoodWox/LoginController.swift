//
//  ViewController.swift
//  GoodWox
//
//  Created by Cody Liu on 6/4/16.
//  Copyright © 2016 WiAdvance. All rights reserved.
//

import UIKit

class LoginController: UIViewController {

    let authentication: Authentication = Authentication()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        // There is only one segue
        let profileViewController: ProfileController = segue.destinationViewController as! ProfileController
        profileViewController.authentication = authentication
    }

    @IBAction func login(){
        authenticate()
    }
    
    
}

// MARK: Authentication
private extension LoginController {
    func authenticate() {
        // loadingUI(show: true)
        
        let clientId = ApplicationConstants.clientId
        let scopes = ApplicationConstants.scopes
        
        authentication.connectToGraph(withClientId: clientId, scopes: scopes) {
            (error) in
            
            //defer {self.loadingUI(show: false)}
            
            if let graphError = error {
                NSLog("Login failed")
                switch graphError {
                case .NSErrorType(let nsError):
                    print("Error:", nsError.localizedDescription)
                    // self.showError(message: "Check print log for error details")
                }
            }
            else {
                NSLog("Login successful")
                self.performSegueWithIdentifier("login", sender: nil)
            }
        }
    }
}