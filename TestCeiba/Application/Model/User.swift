//
//  User.swift
//  TestCeiba
//
//  Created by Leonardo Mendez on 23/08/22.
//

import ObjectMapper

public struct UserMapper: Mappable {
    
    public var id: Int = 0
    public var name: String = ""
    public var email: String = ""
    public var phone: String = ""
    
    public init?(map: Map) {}
    public init() {}
    
    public mutating func mapping(map: Map) {
        id <- map["id"]
        name <- map["name"]
        email <- map["email"]
        phone <- map["phone"]
    }
    
}
