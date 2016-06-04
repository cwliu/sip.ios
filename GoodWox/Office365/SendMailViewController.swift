// *********************************************************
//
// O365-iOS-Connect, https://github.com/OfficeDev/O365-iOS-Connect
//
// Copyright (c) Microsoft Corporation
// All rights reserved.
//
// MIT License:
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//
// *********************************************************

import UIKit

class SendMailViewController: UIViewController {
    
    @IBOutlet weak var headerLabel: UILabel!
    @IBOutlet weak var mainContentTextView: UITextView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var sendMailButton: UIButton!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var statusTextView: UITextView!
    @IBOutlet weak var disconnectButton: UIBarButtonItem!
    
    var baseController = Office365ClientFetcher()
    var serviceEndpointLookup = NSMutableDictionary()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view, typically from a nib.
        disconnectButton.enabled = false
        sendMailButton.hidden = true
        emailTextField.hidden = true
        mainContentTextView.hidden = true
        headerLabel.hidden = true
        statusTextView.hidden = true
        activityIndicator.hidden = true

        connectToOffice365()
    }
    
    func connectToOffice365() {
        // Connect to the service by discovering the service endpoints and authorizing
        // the application to access the user's email. This will store the user's
        // service URLs in a property list to be accessed when calls are made to the
        // service. This results in two calls: one to authenticate, and one to get the
        // URLs. ADAL will cache the access and refresh tokens so you won't need to
        // provide credentials unless you sign out.
        
        // Get the discovery client. First time this is ran you will be prompted
        // to provide your credentials which will authenticate you with the service.
        // The application will get an access token in the response.
        
        baseController.fetchDiscoveryClient { (discoveryClient) -> () in
            let servicesInfoFetcher = discoveryClient.getservices()
            
            // Call the Discovery Service and get back an array of service endpoint information
            
            let servicesTask = servicesInfoFetcher.readWithCallback{(serviceEndPointObjects:[AnyObject]!, error:MSODataException!) -> Void in
                let serviceEndpoints = serviceEndPointObjects as! [MSDiscoveryServiceInfo]
                
                if (serviceEndpoints.count > 0) {
                    // Here is where we cache the service URLs returned by the Discovery Service. You may not
                    // need to call the Discovery Service again until either this cache is removed, or you
                    // get an error that indicates that the endpoint is no longer valid.

                    var serviceEndpointLookup = [NSObject: AnyObject]()
                    
                    for serviceEndpoint in serviceEndpoints {
                        serviceEndpointLookup[serviceEndpoint.capability] = serviceEndpoint.serviceEndpointUri
                    }
                    
                    // Keep track of the service endpoints in the user defaults
                    let userDefaults = NSUserDefaults.standardUserDefaults()
                    
                    userDefaults.setObject(serviceEndpointLookup, forKey: "O365ServiceEndpoints")
                    userDefaults.synchronize()
                    
                    dispatch_async(dispatch_get_main_queue()) {
                        let userEmail = userDefaults.stringForKey("LogInUser")!
                        var parts = userEmail.componentsSeparatedByString("@")
                        
                        self.headerLabel.text = String(format:"Hi %@!", parts[0])
                        self.headerLabel.hidden = false
                        self.mainContentTextView.hidden = false
                        self.emailTextField.text = userEmail
                        self.statusTextView.text = ""
                        self.disconnectButton.enabled = true
                        self.sendMailButton.hidden = false
                        self.emailTextField.hidden = false
                    }
                }
                
                else {
                    dispatch_async(dispatch_get_main_queue()) {
                        NSLog("Error in the authentication: %@", error)
                        let alert: UIAlertView = UIAlertView(title: "Error", message: "Authentication failed. This may be because the Internet connection is offline  or perhaps the credentials are incorrect. Check the log for errors and try again.", delegate: self, cancelButtonTitle: "OK")
                            alert.show()
                    }
                }
            }

            servicesTask.resume()
        }
    }

    func sendMailMessage() {
        let message = buildMessage()
        
        // Get the MSOutlookClient. A call will be made to Azure AD and you will be prompted for credentials if you don't
        // have an access or refresh token in your token cache.
        
        baseController.fetchOutlookClient {
            (outlookClient) -> Void in

            dispatch_async(dispatch_get_main_queue()) {
                // Show the activity indicator
                self.activityIndicator.hidden = false
                self.activityIndicator.startAnimating()
            }
            
            let userFetcher = outlookClient.getMe()
            let userOperations = (userFetcher.operations as MSOutlookUserOperations)
            
            let task = userOperations.sendMailWithMessage(message, saveToSentItems: true) {
                (returnValue:Int32, error:MSODataException!) -> Void in

                var statusText: String

                if (error == nil) {
                    statusText = "Check your inbox, you have a new message. :)"
                }
                else {
                    statusText = "The email could not be sent. Check the log for errors."
                    NSLog("%@",[error.localizedDescription])
                }

                // Update the UI.
                
                dispatch_async(dispatch_get_main_queue()) {
                    self.statusTextView.text = statusText
                    self.statusTextView.hidden = false
                    self.activityIndicator .stopAnimating()
                    self.activityIndicator.hidden = true
                }
            }

            task.resume()
        }
    }

    // Compose the mail message
    func buildMessage() -> MSOutlookMessage {
        // Create a new message. Set properties on the message.
        let  message: MSOutlookMessage  = MSOutlookMessage()
        message.Subject = "Welcome to Office 365 development on iOS with the Office 365 Connect sample"

        // Get the recipient's email address.
        // The ToRecipients property is an array of MSOulookRecipient objects.
        // See the helper method getRecipients to understand the usage.
        let toEmail = emailTextField.text
    
        let recipient = MSOutlookRecipient()
        recipient.EmailAddress = MSOutlookEmailAddress()
        recipient.EmailAddress.Address = toEmail!.stringByTrimmingCharactersInSet(NSCharacterSet.whitespaceCharacterSet())
    
        // The mutable array here is required to maintain compatibility with the API
        var recipientArray: [MSOutlookRecipient] = []
        recipientArray.append(recipient as MSOutlookRecipient)
        let mutableRecipientArray = NSMutableArray(array: recipientArray)
        message.ToRecipients = mutableRecipientArray

        // Get the email text and put in the email body.
        let filePath = NSBundle.mainBundle().pathForResource("EmailBody", ofType:"html")
        let body = (try? NSString(contentsOfFile: filePath!, encoding: NSUTF8StringEncoding))?.stringByReplacingOccurrencesOfString("\"", withString: "\\\"");
        
        message.Body = MSOutlookItemBody()
        message.Body.ContentType = MSOutlookBodyType.BodyType_HTML
        message.Body.Content = body! as String

        return message
    }

    @IBAction func disconnectBtnClicked(sender: AnyObject) {
        disconnectButton.enabled = false
        sendMailButton.hidden = true
        mainContentTextView.text = "You're no longer connected to Office 365."
        headerLabel.hidden = true
        emailTextField.hidden = true
        statusTextView.hidden = true
        
        // Clear the access and refresh tokens from the credential cache. You need to clear cookies
        // since ADAL uses information stored in the cookies to get a new access token.
        let authenticationManager:AuthenticationManager = AuthenticationManager.sharedInstance
        authenticationManager.clearCredentials()
    }

    @IBAction func sendMailBtnClicked(sender: AnyObject) {
        self.emailTextField.resignFirstResponder()

        sendMailMessage()
    }
}
