//
//  Default.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 24/08/22.
//

import UIKit

public struct Default {
    
    public enum Key: String {
        case userId
    }
    
    public static func userId() -> Int? {
        let defaults = UserDefaults.standard
        return defaults.object(forKey: Default.Key.userId.rawValue) as? Int
    }
    
    public static func save(userId: Int) {
        let defaults = UserDefaults.standard
        defaults.set(userId, forKey: Default.Key.userId.rawValue)
    }
    
}
