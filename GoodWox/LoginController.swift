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
        self.navigationController?.navigationBarHidden = true        
        // Do any additional setup after loading the view, typically from a nib.

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {

        // There is only one segue
        let tabController: TabController = segue.destinationViewController as! TabController
        let cc: CompanyController = tabController.viewControllers![3] as! CompanyController
        let pc: ProfileController = tabController.viewControllers![4] as! ProfileController
        cc.authentication = authentication
        pc.authentication = authentication
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
        self.navigationController?.navigationBarHidden = true
    }

    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.navigationController?.navigationBarHidden = false
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