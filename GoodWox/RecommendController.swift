import Foundation

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
            button.enabled = false
            
            ContactDbHelper.addContect(contact.name, phoneList: contact.phoneList, type: ContactType.MANUAL)
        }
    }
}
