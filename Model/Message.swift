//
//  Message.swift
//  Inna
//
//  Created by MOSHIOUR on 5/20/18.
//  Copyright © 2018 moshiour. All rights reserved.
//

import UIKit

class Message: NSObject {
    
    var fromId: String?
    var text: String?
    var timestamp: NSNumber?
    var toId: String?
    
    init(dictionary: [String: Any]) {
        self.fromId = dictionary["fromId"] as? String
        self.text = dictionary["text"] as? String
        self.toId = dictionary["toId"] as? String
        self.timestamp = dictionary["timestamp"] as? NSNumber
    }
    
}

