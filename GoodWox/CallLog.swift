import Foundation
import CoreData

class CallLog: NSManagedObject {
    
    @NSManaged var callDuration: NSNumber?
    @NSManaged var callTime: Date?
    @NSManaged var type: NSNumber?
    @NSManaged var contact: Contact?

}
