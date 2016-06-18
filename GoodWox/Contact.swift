import Foundation
import CoreData
//class Contact {
//    var name: String = ""
//    var email: String = ""
//    
//    init(name: String, email: String){
//        self.name = name
//        self.email = email
//    }
//}

enum ContactType {
    case COMPANY
    case PHONE
    case MANUAL
    case UNKNOWN
}

class Contact: NSManagedObject {
    
    @NSManaged var uid: String
    @NSManaged var name: String
    @NSManaged var type: NSNumber
    @NSManaged var email: String?
    @NSManaged var phoneList: [String]?
    @NSManaged var sip: String?
    @NSManaged var photo: NSData?
}