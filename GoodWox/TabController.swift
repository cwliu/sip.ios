import UIKit


class TabController: UITabBarController{

    var freshLaunch = true
    override func viewWillAppear(animated: Bool) {
        if freshLaunch == true {
            freshLaunch = false
            
            if ContactDbHelper.getFavoriteContact().count > 0 {
                self.selectedIndex = 0 // Set default tab to being favorite tab
            }else{
                self.selectedIndex = 3 // Set default tab to being company tab
            }
        }
    }
}