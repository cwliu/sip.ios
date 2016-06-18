import Foundation
import CoreData

class ContactDbHelper {
    
    static let ENTITY: String = "Contact"
    
    static func getAll() -> [Contact]{
        var contacts: [Contact] = []
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: ENTITY)
            do {
                contacts = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Contact]
            } catch {
                print(error)
            }
        }
        return contacts
    }
    
    static func deleteAll()
    {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest(entityName: ENTITY)
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try managedContext.executeFetchRequest(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                managedContext.deleteObject(managedObjectData)
            }
        } catch let error as NSError {
            print("Detele all data in \(ENTITY) error : \(error) \(error.userInfo)")
        }
    }
}

