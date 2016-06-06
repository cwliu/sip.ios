//
//  TabController.swift
//  GoodWox
//
//  Created by Cody Liu on 6/6/16.
//  Copyright © 2016 WiAdvance. All rights reserved.
//

import UIKit


class TabController: UITabBarController{

    var freshLaunch = true
    override func viewWillAppear(animated: Bool) {
        if freshLaunch == true {
            freshLaunch = false
//            self.tabBarController?.selectedIndex = 3 // 5th tab
        }
    }
}