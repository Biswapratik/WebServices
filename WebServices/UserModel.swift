//
//  UserModel.swift
//  WebServices
//
//  Created by Biswapratik Maharana on 23/08/20.
//  Copyright © 2020 Biswapratik Maharana. All rights reserved.
//

import UIKit

class User {
    
    var avatar: String?
    var email: String?
    var first_name: String?
    var id: Int? = 0
    var last_name: String?
    
    init(userDetails: [String: Any]) {
        avatar = userDetails["avatar"] as? String
        email = userDetails["email"] as? String
        first_name = userDetails["first_name"] as? String
        last_name = userDetails["last_name"] as? String
        id = userDetails["id"] as? Int
    }
    
//    func loadUserProfilePic(imageView: UIImageView) {
//        if let image = user?.avatar as? String, let url = URL(string: image) {
//            cell.imageView?.image = UIImage(data: try! Data(contentsOf: url))
//        }
//    }
    
}
