//
//  User+CoreDataProperties.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 24/08/22.
//
//

import Foundation
import CoreData


extension User {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }

    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var phone: String?
    @NSManaged public var email: String?

}

extension User : Identifiable {

}
