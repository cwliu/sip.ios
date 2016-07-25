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
            } catch let error{
                NSLog("\(error)")
            }
        }
        return contacts
    }
    
    static func deleteAll(){
        
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
    
    static func getContactsByType(type: ContactType) -> [Contact] {
        var contacts: [Contact] = []
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: ENTITY)
            fetchRequest.predicate = NSPredicate(format: "type == %d", type.hashValue)
            
            let sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            fetchRequest.sortDescriptors = sortDescriptors
            
            do {
                contacts = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Contact]
            } catch let error{
                NSLog("\(error)")
            }
        }
        return contacts
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
            } catch let error{
                NSLog("\(error)")
            }
        }
        return nil
    }
    
    static func getContactById(id: NSManagedObjectID) -> Contact? {
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {            
            do {
                let contact = try managedObjectContext.existingObjectWithID(id) as? Contact
                return contact
                    
            } catch let error{
                NSLog("\(error)")
            }
        }
        return nil
    }
    
    static func getContactBySip(sip: String) -> Contact?{
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: ENTITY)
            fetchRequest.predicate = NSPredicate(format: "sip == %@", sip)
            
            do {
                let contacts = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Contact]
                if contacts.count > 0 {
                    return contacts[0]
                }
            } catch let error{
                NSLog("\(error)")
            }
        }
        return nil
    }
    
    static func getFavoriteContact() -> [Contact] {
        var contacts: [Contact] = []
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: ENTITY)
            fetchRequest.predicate = NSPredicate(format: "isFavorite == 1")
            
            let sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            fetchRequest.sortDescriptors = sortDescriptors
            
            do {
                contacts = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Contact]
            } catch let error{
                NSLog("\(error)")
            }
        }
        
        return contacts
    }
    
    static func getMostContacted() -> [Contact] {
        var contacts: [Contact] = []
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest(entityName: ENTITY)
            fetchRequest.predicate = NSPredicate(format: "usageCount > 0")
            
            let sortDescriptors = [NSSortDescriptor(key: "usageCount", ascending: false)]
            fetchRequest.sortDescriptors = sortDescriptors
            
            do {
                contacts = try managedObjectContext.executeFetchRequest(fetchRequest) as! [Contact]
            } catch let error{
                NSLog("\(error)")
            }
        }
        
        return contacts
    }
    
    static func addContect(name: String, email: String, type: ContactType){
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext{
            
            let contact = NSEntityDescription.insertNewObjectForEntityForName("Contact", inManagedObjectContext: managedObjectContext) as! Contact
            do {
                try Exception.catchException {
                    
                    contact.name = name
                    contact.email = email
                    contact.type = type.hashValue
                }
                
            } catch let error{
                NSLog("NSError ocurred: \(error)")
                managedObjectContext.deleteObject(contact)
            }
        }
    }
    
    static func normalizePhone(phone: String) -> String{
        return phone
    }
    
    static func addContect(name: String, phoneList: [String], type: ContactType) -> Void {
        
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext{
            
            let contact = NSEntityDescription.insertNewObjectForEntityForName("Contact", inManagedObjectContext: managedObjectContext) as! Contact
            do {
                try Exception.catchException {
                    
                    contact.name = name
                    contact.type = type.hashValue
                }
                
                var normalizedPhoneList = [String]()
                for phone in phoneList{
                    normalizedPhoneList.append(normalizePhone(phone))
                }
                contact.phones = normalizedPhoneList

            } catch let error{
                NSLog("NSError ocurred: \(error)")
                managedObjectContext.deleteObject(contact)
            }
        }
        save()
    }
    
    static func updateContact(contact: Contact){
        
        do {
            try contact.managedObjectContext?.save()
        } catch {
            let saveError = error as NSError
            NSLog("Save error: \(saveError)")
        }
    }
    
    static func save(){
        if let managedObjectContext = (UIApplication.sharedApplication().delegate as? AppDelegate)?.managedObjectContext {
            do {
                try managedObjectContext.save()
            } catch {
                NSLog("Error ocurred: \(error)")
            }
            
        }
    }
}

