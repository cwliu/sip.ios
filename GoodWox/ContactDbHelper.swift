import Foundation
import CoreData

class ContactDbHelper {
    
    static let ENTITY: String = "Contact"
    
    static func getAll() -> [Contact]{
        var contacts: [Contact] = []
        
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY)
            
            let sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            fetchRequest.sortDescriptors = sortDescriptors

            do {
                contacts = try managedObjectContext.fetch(fetchRequest) as! [Contact]
            } catch let error{
                NSLog("\(error)")
            }
        }
        return contacts
    }
    
    static func deleteAll(){
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY)
        fetchRequest.returnsObjectsAsFaults = false
        
        do{
            let results = try managedContext.fetch(fetchRequest)
            for managedObject in results
            {
                let managedObjectData:NSManagedObject = managedObject as! NSManagedObject
                managedContext.delete(managedObjectData)
            }
        } catch let error as NSError {
            print("Detele all data in \(ENTITY) error : \(error) \(error.userInfo)")
        }
    }
    
    static func getContactsByType(_ type: ContactType) -> [Contact] {
        var contacts: [Contact] = []
        
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY)
            fetchRequest.predicate = NSPredicate(format: "type == %d", type.hashValue)
            
            let sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            fetchRequest.sortDescriptors = sortDescriptors
            
            do {
                contacts = try managedObjectContext.fetch(fetchRequest) as! [Contact]
            } catch let error{
                NSLog("\(error)")
            }
        }
        return contacts
    }
    
    static func getContact(_ email: String) -> Contact? {
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY)
            fetchRequest.predicate = NSPredicate(format: "email == %@", email)
            
            do {
                let contacts = try managedObjectContext.fetch(fetchRequest) as! [Contact]
                if contacts.count > 0 {
                    return contacts[0]
                }
            } catch let error{
                NSLog("\(error)")
            }
        }
        return nil
    }
    
    static func getContactById(_ id: NSManagedObjectID) -> Contact? {
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {            
            do {
                let contact = try managedObjectContext.existingObject(with: id) as? Contact
                return contact
                    
            } catch let error{
                NSLog("\(error)")
            }
        }
        return nil
    }
    
    static func getContactBySip(_ sip: String) -> Contact?{
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY)
            fetchRequest.predicate = NSPredicate(format: "sip == %@", sip)
            
            do {
                let contacts = try managedObjectContext.fetch(fetchRequest) as! [Contact]
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
        
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY)
            fetchRequest.predicate = NSPredicate(format: "isFavorite == 1")
            
            let sortDescriptors = [NSSortDescriptor(key: "name", ascending: true)]
            fetchRequest.sortDescriptors = sortDescriptors
            
            do {
                contacts = try managedObjectContext.fetch(fetchRequest) as! [Contact]
            } catch let error{
                NSLog("\(error)")
            }
        }
        
        return contacts
    }
    
    static func getMostContacted() -> [Contact] {
        var contacts: [Contact] = []
        
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: ENTITY)
            fetchRequest.predicate = NSPredicate(format: "usageCount > 0")
            
            let sortDescriptors = [NSSortDescriptor(key: "usageCount", ascending: false)]
            fetchRequest.sortDescriptors = sortDescriptors
            
            do {
                contacts = try managedObjectContext.fetch(fetchRequest) as! [Contact]
            } catch let error{
                NSLog("\(error)")
            }
        }
        
        return contacts
    }
    
    static func addContect(_ name: String, email: String, type: ContactType){
        
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext{
            
            let contact = NSEntityDescription.insertNewObject(forEntityName: "Contact", into: managedObjectContext) as! Contact
            do {
                try Exception.catch {
                    
                    contact.name = name
                    contact.email = email
                    contact.type = type.hashValue as NSNumber?
                }
                
            } catch let error{
                NSLog("NSError ocurred: \(error)")
                managedObjectContext.delete(contact)
            }
        }
    }
    
    static func normalizePhone(_ phone: String) -> String{
        return phone
    }
    
    static func addContect(_ name: String, phoneList: [String], type: ContactType) -> Void {
        
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext{
            
            let contact = NSEntityDescription.insertNewObject(forEntityName: "Contact", into: managedObjectContext) as! Contact
            do {
                try Exception.catch {
                    
                    contact.name = name
                    contact.type = type.hashValue as NSNumber?
                }
                
                var normalizedPhoneList = [String]()
                for phone in phoneList{
                    normalizedPhoneList.append(normalizePhone(phone))
                }
                contact.phones = normalizedPhoneList
                
                save()
            } catch let error{
                NSLog("NSError ocurred: \(error)")
                managedObjectContext.delete(contact)
            }
        }
    }
    
    static func updateContact(_ contact: Contact){
        
        do {
            try contact.managedObjectContext?.save()
        } catch {
            let saveError = error as NSError
            NSLog("Save error: \(saveError)")
        }
    }
    
    static func save(){
        if let managedObjectContext = (UIApplication.shared.delegate as? AppDelegate)?.managedObjectContext {
            do {
                try managedObjectContext.save()
            } catch {
                NSLog("Error ocurred: \(error)")
            }
            
        }
    }
}

