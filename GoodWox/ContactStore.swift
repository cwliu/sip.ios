import Foundation

enum DownloadResult{
    case Success
    case Failure(ErrorType)
}

class ContactStore {
    
    var contactList = [Contact]()
    
}