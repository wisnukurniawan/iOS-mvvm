//
//  Friend.swift
//  TableViewExample
//
//  Created by Wisnu on 3/1/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import Foundation

class Friend {
    var name: String?
    var pictureUrl: String?
    
    init(json: JSONDictionary) {
        self.name = json["name"] as? String
        self.pictureUrl = json["pictureUrl"] as? String
    }
    
}
