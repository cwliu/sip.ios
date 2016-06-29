import Foundation
import CoreData

class CallLog: NSManagedObject {
    
    @NSManaged var callDuration: NSNumber?
    @NSManaged var callTime: NSDate?
    @NSManaged var type: NSNumber?
    @NSManaged var contact: Contact?

}
