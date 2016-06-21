import Foundation
import CoreData

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
    @NSManaged var phones: [String]
    @NSManaged var sip: String?
    @NSManaged var photo: NSData?
}