//
//  Contact+CoreDataProperties.swift
//  Pods
//
//  Created by Cody Liu on 6/25/16.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Contact {

    @NSManaged var uid: String?
    @NSManaged var name: String?
    @NSManaged var email: String?
    @NSManaged var phones: [String]
    @NSManaged var photo: NSData?
    @NSManaged var sip: String?
    @NSManaged var type: NSNumber?
    @NSManaged var isFavorite: NSNumber?
    
}
