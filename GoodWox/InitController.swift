import Foundation


class InitController: UIViewController{
    
    override func viewDidAppear(animated: Bool) {
        self.performSegueWithIdentifier("main", sender: nil)
    }
}
