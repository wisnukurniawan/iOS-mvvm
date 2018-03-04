//
//  Attribute.swift
//  TableViewExample
//
//  Created by Wisnu on 3/1/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import Foundation

class Attribute {
    var key: String?
    var value: String?
    
    init(json: JSONDictionary) {
        self.key = json["key"] as? String
        self.value = json["value"] as? String
    }
    
}
