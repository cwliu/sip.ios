import Foundation
import Alamofire

class RecommendController: UITableViewController {
    
    var jsonObject: [String: AnyObject] = [:]
    var contactName: String = ""
    
    @IBOutlet var statusLabel: UILabel!
    
    var recommendList: [RecommendContact] = []
    
    override func viewDidLoad(){
        let rightFinishlBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "關閉", style: UIBarButtonItemStyle.Plain, target: self, action: #selector(RecommendController.finishClick))
        rightFinishlBarButtonItem.width = -16
        self.navigationItem.setRightBarButtonItem(rightFinishlBarButtonItem, animated: true)
        
        self.navigationItem.hidesBackButton = true
        self.title = "推薦連絡人"
        
        let nib = UINib(nibName: "RecommendCell", bundle: nil)
        self.tableView.registerNib(nib, forCellReuseIdentifier: "RecommendCell")
        
        statusLabel.text = "持有 \(contactName) 名片的人，也擁有以下名片:"
        
        for recommend in (jsonObject["recommend_list"] as! NSArray){
            var phoneList = [String]()
            
            let name = recommend["name"] as! String
            let percent = recommend["percent"] as! Float
            
            for phone in recommend["phone_list"] as! NSArray{
                phoneList.append(phone as! String)
            }
            
            let c = RecommendContact(name: name, percent: percent, phoneList: phoneList)
            
            recommendList.append(c)
        }
    }
    
    func finishClick(){
        dismissViewControllerAnimated(true, completion: {});
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommendList.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        let cell = tableView.dequeueReusableCellWithIdentifier("RecommendCell", forIndexPath: indexPath)as! RecommendCell
        
        cell.nameLabel.text = recommendList[index].name
        let percentText = String(Int(recommendList[index].percent))
        cell.percentLabel.text = "\(percentText)% 持有率"
        
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(RecommendController.addClick))
        singleTap.numberOfTapsRequired = 1
        cell.addButton.addGestureRecognizer(singleTap)
        cell.addButton.layer.borderWidth = 0.8
        cell.addButton.layer.borderColor = UIColor(colorLiteralRed: 125/255, green: 207/255, blue: 225/255, alpha: 1).CGColor
        cell.addButton.tag = indexPath.row
        
        return cell
    }
    
    // MARK: Segue
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
    
    func addClick(sender: UITapGestureRecognizer){
        NSLog("Single Tap on favoriteClick")
        
        
        if let index = sender.view?.tag{
            let contact = self.recommendList[index]
            
            let button = sender.view as! UIButton
            button.setTitle("已加入", forState: UIControlState.Normal)
            button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            button.backgroundColor = UIColor(colorLiteralRed: 125/255, green: 207/255, blue: 225/255, alpha: 1)
            button.enabled = false
            
            saveContactToBackend(contact.name, phoneList: contact.phoneList)
            ContactDbHelper.addContect(contact.name, phoneList: contact.phoneList, type: ContactType.MANUAL)
        }
    }
    
    func saveContactToBackend(name: String, phoneList: [String]){
        
        let request = NSMutableURLRequest(URL: NSURL(string: SipServerBackend.contactURL)!)
        request.HTTPMethod = "POST"
        
        do {
            let phoneListJson = try NSJSONSerialization.dataWithJSONObject(phoneList, options: NSJSONWritingOptions.PrettyPrinted)
            
            let parameters: [String: String] = [
                "email": UserData.getGraphAccount()!,
                "backend_access_token": UserData.getBackendAccessToken()!,
                "contact_name": name,
                "contact_phone_list": NSString(data: phoneListJson, encoding: NSUTF8StringEncoding)! as String
            ]
            
            Alamofire.request(.POST, request, parameters: parameters).responseJSON { response in
                
                
                switch response.result {
                case .Success:
                    NSLog("Validation Successful")
                    
                case .Failure(let error):
                    // Logout
                    NSLog("\(error), \(String(data: response.data!, encoding: NSUTF8StringEncoding))")
                    UserData.clear()
                    return
                }
            }
        }catch let error as NSError{
            NSLog(error.description)
            return
        }
    }
}
