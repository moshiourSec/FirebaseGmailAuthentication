//
//  User.swift
//  Inna
//
//  Created by MOSHIOUR on 4/3/18.
//  Copyright © 2018 moshiour. All rights reserved.
//

import UIKit

class User: NSObject {
    var id: String?
    var name: String?
    var email: String?
    var profileImageUrl: String?
    
    init(dictionary: [String: Any]) {
        self.id = dictionary["id"] as? String
        self.name = dictionary["name"] as? String ?? ""
        self.email = dictionary["email"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? String
    }
}
