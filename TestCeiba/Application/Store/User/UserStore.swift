//
//  UserStore.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import UIKit
import Alamofire
import ObjectMapper

public struct UserStore {
    
    public init() {}
    
    func requestRouter() -> Router {
        let request = UserRoute.users
        return request
    }
    
    public func fetchUsers( _ completion: @escaping(_ users: [Publisher]?) -> Void) {
         let request = requestRouter()
        AF.request(request).validate().responseJSON { response in
            guard let statusCode = response.response?.statusCode else { return completion(nil) }
            if statusCode >= 200 && statusCode <= 210 {
                switch response.result {
                case .success(let value):
                    if let value = value as? [[String: Any]] {
                        let users = Mapper<Publisher>().mapArray(JSONArray: value)
                        completion(users)
                    } else {
                        completion(nil)
                    }
                case .failure(let error):
                    print(error)
                    completion(nil)
                }
            }
        }
    }
    
}
