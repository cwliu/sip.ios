//
//  CompanyController.swift
//  GoodWox
//
//  Created by Cody Liu on 6/6/16.
//  Copyright © 2016 WiAdvance. All rights reserved.
//

import Foundation

class CompanyController: UITableViewController{
    
    override func viewDidLoad() {
        //         Get the height of the status bar
        let statusBarHeight = UIApplication.sharedApplication().statusBarFrame.height
        
        let insets = UIEdgeInsets(top: statusBarHeight, left: 0, bottom: 0, right: 0)
        tableView.contentInset = insets
        tableView.scrollIndicatorInsets = insets
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .Value1, reuseIdentifier: "Cell")
        cell.textLabel?.text = "Hello World"
        return cell
    }
}