//
//  PostStore.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import UIKit
import Alamofire
import ObjectMapper

public struct PostStore {
    
    public init() {}
    
    func requestRouter(userId: String) -> Router {
        let request = PostRouter.post(userId: userId)
        return request
    }
    
    public func fetchPost(userId: String, _ completion: @escaping(_ posts: [UserPost]?) -> Void) {
        AF.request(requestRouter(userId: userId)).validate().responseJSON { response in
            guard let statusCode = response.response?.statusCode else { return completion(nil) }
            if statusCode >= 200 && statusCode <= 210 {
                switch response.result {
                case .success(let value):
                    if let value = value as? [[String: Any]] {
                        let post = Mapper<UserPost>().mapArray(JSONArray: value)
                        completion(post)
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
