import UIKit


class TabController: UITabBarController{

    var freshLaunch = true
    override func viewWillAppear(animated: Bool) {
        if freshLaunch == true {
            freshLaunch = false
            self.selectedIndex = 3 // Set default tab to being profile page
        }
    }
}