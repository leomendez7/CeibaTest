//
//  UserRoute.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import ObjectMapper
import Alamofire

enum UserRoute: Router {
    
    case users
    
    var config: APIConfig {
        return serverDomain()
    }
    
    var query: APIQuery {
        switch(self) {
        case .users:
            return APIQuery(httpMethod: .get, path: "/users")
        }
    }
    
}
