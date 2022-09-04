//
//  UserList+CoreDataProperties.swift
//  
//
//  Created by Horacio Solorio on 03/09/22.
//
//

import Foundation
import CoreData


extension UserList {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<UserList> {
        return NSFetchRequest<UserList>(entityName: "UserList")
    }

    @NSManaged public var userId: Int16
    @NSManaged public var name: String?
    @NSManaged public var email: String?
    @NSManaged public var phone: String?

}
