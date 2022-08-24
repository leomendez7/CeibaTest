//
//  Post.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import ObjectMapper

public struct UserPost: Mappable {
    
    public var id: Int = 0
    public var userId: Int = 0
    public var title: String = ""
    public var body: String = ""
    
    public init?(map: Map) {}
    public init() {}
    
    public mutating func mapping(map: Map) {
        id <- map["id"]
        userId <- map["userId"]
        title <- map["title"]
        body <- map["body"]
    }
    
}
