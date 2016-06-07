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
            self.selectedIndex = 4 // Set default selected tab
        }
    }
}