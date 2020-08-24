//
//  NewUser.swift
//  WebServices
//
//  Created by Biswapratik Maharana on 24/08/20.
//  Copyright © 2020 Biswapratik Maharana. All rights reserved.
//

import Foundation

class UserDetails: Codable {
    
    var data: NewUser?
    
}

class NewUser: Codable {
    
    var avatar: String?
    var email: String?
    var first_name: String?
    var id: Int? = 0
    var last_name: String?
    
}

class UsersInfo: Codable {
    var page: Int?
    var per_page: Int?
    var total: Int?
    var total_pages: Int?
    var data: [NewUser]?
}

//{
//    "data": {
//        "id": 2,
//        "email": "janet.weaver@reqres.in",
//        "first_name": "Janet",
//        "last_name": "Weaver",
//        "avatar": "https://s3.amazonaws.com/uifaces/faces/twitter/josephstein/128.jpg"
//    },
//    "ad": {
//        "company": "StatusCode Weekly",
//        "url": "http://statuscode.org/",
//        "text": "A weekly newsletter focusing on software development, infrastructure, the server, performance, and the stack end of things."
//    }
//}
