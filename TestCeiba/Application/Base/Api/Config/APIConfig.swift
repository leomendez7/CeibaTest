//
//  APIConfig.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import UIKit
import Alamofire

enum APIConfig {
    
    case production
    
    var source: (host: String, headers: [String: String]?) {
        switch self {
        case .production:
            return (host: "https://jsonplaceholder.typicode.com", headers: ["Authorization": ""])
        }
    }

}
