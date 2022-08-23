//
//  NSMutableURLRequestHeaders.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import UIKit

extension URLRequest {
    
    mutating func addHTTPHeaders(_ headers: [String: String]?) {
        guard let headers = headers else { return }
        for (key, value) in headers {
            setValue(value, forHTTPHeaderField: key)
        }
    }
    
}
