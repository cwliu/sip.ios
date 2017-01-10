import Foundation
import CoreData

enum CallLogType {
    case outgoing_CALL_ANSWERED
    case outgoing_CALL_NO_ANSWER
    case incoming_CALL_ANSWERED
    case incoming_CALL_NO_ANSWER
}

class CallLogDbHelper {
    static var ENTITY = "CallLog"
    
    static func addCallLog(_ contact: Contact, callTime: Date, callDuration: Int, callType: CallLogType){
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext{
            
            let callLog = NSEntityDescription.insertNewObject(forEntityName: ENTITY, into: managedObjectContext) as! CallLog
            
            do {
                callLog.callTime = callTime
                callLog.callDuration = callDuration as NSNumber?
                callLog.type = callType.hashValue as NSNumber?
                callLog.contact = contact
                
                try managedObjectContext.save()
                
            } catch let error{
                NSLog("NSError ocurred: \(error)")
                managedObjectContext.delete(contact)
            }
        }
    }
    
    static func getAll() -> [CallLog]{
        var logs: [CallLog] = []
        
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY)
            
            let sortDescriptors = [NSSortDescriptor(key: "callTime", ascending: false)]
            fetchRequest.sortDescriptors = sortDescriptors
            
            do {
                logs = try managedObjectContext.fetch(fetchRequest) as! [CallLog]
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
