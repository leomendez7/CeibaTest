//
//  ManagedParser.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 24/08/22.
//

import UIKit
import CoreData

class ManagedParser: NSObject {
    
    class func convertToArray(managedObjects:NSArray?, parentNode:String? = nil) -> NSArray {
        let rtnArr: NSMutableArray = NSMutableArray()
        if let managedObjs: [NSManagedObject] = managedObjects as? [NSManagedObject] {
            for managedObject: NSManagedObject in managedObjs {
                rtnArr.add(self.convertToDictionary(managedObject: managedObject, parentNode: parentNode))
            }
        }
        return rtnArr;
    }

    class func convertToDictionary(managedObject:NSManagedObject, parentNode:String? = nil) -> NSDictionary {
        let rtnDict: NSMutableDictionary = NSMutableDictionary()
        let entity: NSEntityDescription = managedObject.entity
        let properties: [String] = (entity.propertiesByName as NSDictionary).allKeys as! [String]
        let parentNode: String = parentNode ?? managedObject.entity.name!
        for property: String in properties  {
            if (property.caseInsensitiveCompare(parentNode) != ComparisonResult.orderedSame) {
                let value: AnyObject? = managedObject.value(forKey: property) as AnyObject
                if let set: NSSet = value as? NSSet  {
                    rtnDict[property] = self.convertToArray(managedObjects: set.allObjects as NSArray, parentNode: parentNode)
                } else if let vManagedObject:NSManagedObject = value as? NSManagedObject {
                    if (vManagedObject.entity.name != parentNode) {
                        rtnDict[property] = self.convertToDictionary(managedObject: vManagedObject, parentNode: parentNode)
                    }
                } else  if let vData:AnyObject = value {
                    rtnDict[property] = vData
                }
            }
        }
        return rtnDict
    }
    
}
