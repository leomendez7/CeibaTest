//
//  APICachePolicy.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import Foundation

enum APICachePolicy {
    case networkOnly
    case cacheOnly
    case networkElseCache
    case cacheThenNetwork
    
    func isCache() -> Bool {
        if self == .networkOnly || self == .networkElseCache { return false }
        return true
    }
}
