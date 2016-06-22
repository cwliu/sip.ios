import Foundation
import CoreData

class ContactDbHelper {
    
    static let ENTITY: String = "Contact"
    
    static func getAll() -> [Contact]{
        var contacts: [Contact] = []
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: ENTITY)
            
            let sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            fetchRequest.sortDescriptors = sortDescriptors

            do {
                contacts = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Contact]
            } catch {
                print(error)
            }
        }
        return contacts
    }
    
    static func getCompnayContacts() -> [Contact] {
        var contacts: [Contact] = []
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: ENTITY)
            fetchRequest.predicate = NSPredicate(format: "type == %d", ContactType.COMPANY.hashValue)
            
            let sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            fetchRequest.sortDescriptors = sortDescriptors
            
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
    
    static func getContact(email: String) -> Contact? {
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: ENTITY)
            fetchRequest.predicate = NSPredicate(format: "email == %@", email)
            
            do {
                let contacts = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Contact]
                if contacts.count > 0 {
                    return contacts[0]
                }
            } catch {
                print(error)
            }
        }
        return nil
    }
    
    static func getContactByType(type: ContactType) -> [Contact] {
        var contacts: [Contact] = []
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            do {
                let fetchRequest = NSFetchRequest(entityName: "Contact")
                fetchRequest.predicate = NSPredicate(format: "type == %d", type.hashValue)
                
                let sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
                fetchRequest.sortDescriptors = sortDescriptors

                contacts = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Contact]                
                
            } catch {
                print(error)
            }
        }
        return contacts
    }
    
    static func addContect(name: String, email: String, type: ContactType) -> Void {
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext{
            
            let contact = NSEntityDescription.insertNewObjectForEntityForName("Contact", inManagedObjectContext: managedObjectContext) as! Contact
            do {
                try Exception.catchException {
                    
                    contact.name = name
                    contact.email = email
                    contact.type = type.hashValue
                }
                
                try managedObjectContext.save()
                
            } catch let error{
                NSLog("NSError ocurred: \(error)")
                managedObjectContext.deleteObject(contact)
            }
        }
    }
    
    static func addContect(name: String, phoneList: [String], type: ContactType) -> Void {
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext{
            
            let contact = NSEntityDescription.insertNewObjectForEntityForName("Contact", inManagedObjectContext: managedObjectContext) as! Contact
            do {
                try Exception.catchException {
                    
                    contact.name = name
                    contact.type = type.hashValue
                }
                
                contact.phones = phoneList
                
                try managedObjectContext.save()
                
            } catch let error{
                NSLog("NSError ocurred: \(error)")
                managedObjectContext.deleteObject(contact)
            }
        }
    }
    
    static func save(){
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            do {
                try managedObjectContext.save()
            } catch {
                print(error)
            }
            
        }
    }
}

