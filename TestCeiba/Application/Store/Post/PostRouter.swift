//
//  PostRouter.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import ObjectMapper
import Alamofire

enum PostRouter: Router {
    
    case post(userId: String)
    
    var config: APIConfig {
        return serverDomain()
    }
    
    var query: APIQuery {
        switch(self) {
        case .post(let userId):
            return APIQuery(httpMethod: .get, path: "/posts", parameters: ["userId": userId])
        }
    }
    
}
