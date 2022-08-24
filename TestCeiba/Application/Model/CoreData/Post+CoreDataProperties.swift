//
//  Post+CoreDataProperties.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 24/08/22.
//
//

import Foundation
import CoreData


extension Post {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Post> {
        return NSFetchRequest<Post>(entityName: "Post")
    }

    @NSManaged public var id: Int64
    @NSManaged public var userId: Int64
    @NSManaged public var title: String?
    @NSManaged public var body: String?

}

extension Post : Identifiable {

}
