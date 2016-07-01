import Foundation
import CoreData

enum CallLogType {
    case OUTGOING_CALL_ANSWERED
    case OUTGOING_CALL_NO_ANSWER
    case INCOMING_CALL_ANSWERED
    case INCOMING_CALL_NO_ANSWER
}

class CallLogDbHelper {
    static var ENTITY = "CallLog"
    
    static func addCallLog(contact: Contact, callTime: NSDate, callDuration: Int, callType: CallLogType){
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext{
            
            let callLog = NSEntityDescription.insertNewObjectForEntityForName(ENTITY, inManagedObjectContext: managedObjectContext) as! CallLog
            
            do {
                try Exception.catchException {
                    
                    callLog.callTime = callTime
                    callLog.callDuration = callDuration
                    callLog.type = callType.hashValue
                    callLog.contact = contact
                }
                
            } catch let error{
                NSLog("NSError ocurred: \(error)")
                managedObjectContext.deleteObject(contact)
            }
        }
    }
    
    static func getAll() -> [CallLog]{
        var logs: [CallLog] = []
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: ENTITY)
            
            let sortDescriptors = [NSSortDescriptor(key: "callTime", ascending: false)]
            fetchRequest.sortDescriptors = sortDescriptors
            
            do {
                logs = try managedObjectContext.executeFetchRequest(fetchRequest) as! [CallLog]
            } catch let error{
                NSLog("\(error)")
            }
        }
        return logs
    }
}

//// Save call log
//
//let entityDescription = NSEntityDescription.entityForName("CallLog", inManagedObjectContext:  self.managedObjectContext)
//let newLog = NSManagedObject(entity: entityDescription!, insertIntoManagedObjectContext:self.managedObjectContext)
//
//let contactEntityDescription = NSEntityDescription.entityForName("Contact", inManagedObjectContext: self.managedObjectContext)
//let newContact = NSManagedObject(entity: contactEntityDescription!, insertIntoManagedObjectContext:self.managedObjectContext)
//newContact.setValue("a@a.com", forKey: "email")
//newContact.setValue("Buzz", forKey: "name")
//
//newLog.setValue(1, forKey: "type")
//newLog.setValue(NSDate(), forKey: "callTime")
//newLog.setValue(6, forKey: "callDuration")
//newLog.setValue(newContact, forKey: "contact")
//do {
//    try newLog.managedObjectContext?.save()
//}catch {
//    NSLog("\(error)")
//}
//
//
//// Fetch
//let fetchRequest = NSFetchRequest()
//fetchRequest.entity = entityDescription
//
//do {
//    let result = try self.managedObjectContext.executeFetchRequest(fetchRequest)
//    NSLog("\(result)")
//    let a = 1
//
//    NSLog(">>>>>>>>>>>>>")
//    if (result.count > 0) {
//        let callLog = result[0] as! NSManagedObject
//
//        print("1 - \(callLog)")
//        NSLog(">>>>>>>>>>>>>")
//
//        if let c = callLog.valueForKey("contact"), time = callLog.valueForKey("callTime") {
//            print("\(c) \(time)")
//        }
//
//        print("2 - \(callLog)")
//        NSLog(">>>>>>>>>>>>>")
//    }
//} catch {
//    let fetchError = error as NSError
//    print(fetchError)
//}