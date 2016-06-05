//
//  ProfileController.swift
//  GoodWox
//
//  Created by Cody Liu on 6/5/16.
//  Copyright © 2016 WiAdvance. All rights reserved.
//

import Foundation
import UIKit

class ProfileController: UIViewController{
    

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var emailLabel: UILabel!
    
    var authentication: Authentication!
    
    lazy var graphClient: MSGraphClient = {
        let client = MSGraphClient.defaultClient()
        return client
    }()
    
    override func viewDidLoad(){
        
        MSGraphClient.setAuthenticationProvider(authentication.authenticationProvider)
        self.getUserInfo()
    }
    
    private func getUserInfo(){
        self.graphClient.me().request().getWithCompletion {
            (user: MSGraphUser?, error: NSError?) in
            if let graphError = error {
                print("Error:", graphError)
                dispatch_async(dispatch_get_main_queue(),{
                    NSLog("Graph Error")
                })
                
            }
            else {
                guard let userInfo = user else {
                    dispatch_async(dispatch_get_main_queue(),{
                        NSLog("User information loading failed.")
                    })
                    return
                }
                
                dispatch_async(dispatch_get_main_queue(),{
                    NSLog("User information loaded.")
                    self.nameLabel.text = userInfo.displayName
                    self.emailLabel.text = userInfo.mail
                })
                
            }
        }
    }
}
