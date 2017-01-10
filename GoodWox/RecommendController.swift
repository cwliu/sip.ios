import Foundation
import Alamofire

class RecommendController: UITableViewController {
    
    var jsonObject: [String: AnyObject] = [:]
    var contactName: String = ""
    
    @IBOutlet var statusLabel: UILabel!
    
    var recommendList: [RecommendContact] = []
    
    override func viewDidLoad(){
        let rightFinishlBarButtonItem:UIBarButtonItem = UIBarButtonItem(title: "關閉", style: UIBarButtonItemStyle.plain, target: self, action: #selector(RecommendController.finishClick))
        rightFinishlBarButtonItem.width = -16
        self.navigationItem.setRightBarButton(rightFinishlBarButtonItem, animated: true)
        
        self.navigationItem.hidesBackButton = true
        self.title = "推薦連絡人"
        
        let nib = UINib(nibName: "RecommendCell", bundle: nil)
        self.tableView.register(nib, forCellReuseIdentifier: "RecommendCell")
        
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
        dismiss(animated: true, completion: {});
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return recommendList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let index = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "RecommendCell", for: indexPath)as! RecommendCell
        
        cell.nameLabel.text = recommendList[index].name
        let percentText = String(Int(recommendList[index].percent))
        cell.percentLabel.text = "\(percentText)% 持有率"
        
        let singleTap = UITapGestureRecognizer(target: self, action:#selector(RecommendController.addClick))
        singleTap.numberOfTapsRequired = 1
        cell.addButton.addGestureRecognizer(singleTap)
        cell.addButton.layer.borderWidth = 0.8
        cell.addButton.layer.borderColor = UIColor(colorLiteralRed: 125/255, green: 207/255, blue: 225/255, alpha: 1).cgColor
        cell.addButton.tag = indexPath.row
        
        return cell
    }
    
    // MARK: Segue
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func addClick(_ sender: UITapGestureRecognizer){
        NSLog("Single Tap on favoriteClick")
        
        
        if let index = sender.view?.tag{
            let contact = self.recommendList[index]
            
            let button = sender.view as! UIButton
            button.setTitle("已加入", for: UIControlState())
            button.setTitleColor(UIColor.white, for: UIControlState())
            button.backgroundColor = UIColor(colorLiteralRed: 125/255, green: 207/255, blue: 225/255, alpha: 1)
            button.isEnabled = false
            
            saveContactToBackend(contact.name, phoneList: contact.phoneList)
            ContactDbHelper.addContect(contact.name, phoneList: contact.phoneList, type: ContactType.manual)
        }
    }
    
    func saveContactToBackend(_ name: String, phoneList: [String]){
        
        let request = NSMutableURLRequest(url: URL(string: SipServerBackend.contactURL)!)
        request.httpMethod = "POST"
        
        do {
            let phoneListJson = try JSONSerialization.data(withJSONObject: phoneList, options: JSONSerialization.WritingOptions.prettyPrinted)
            
            let parameters: [String: String] = [
                "email": UserData.getGraphAccount()!,
                "backend_access_token": UserData.getBackendAccessToken()!,
                "contact_name": name,
                "contact_phone_list": NSString(data: phoneListJson, encoding: String.Encoding.utf8.rawValue)! as String
            ]
            
            Alamofire.request(.POST, request, parameters: parameters).responseJSON { response in
                
                
                switch response.result {
                case .success:
                    NSLog("Validation Successful")
                    
                case .failure(let error):
                    // Logout
                    NSLog("\(error), \(String(data: response.data!, encoding: String.Encoding.utf8))")
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
