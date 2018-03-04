//
//  ProfileViewModelEmailItem.swift
//  TableViewExample
//
//  Created by Wisnu on 3/3/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import Foundation

class EmailItem: ProfileViewModelItem {
    
    var email: String
    
    init(email: String) {
        self.email = email
    }
    
    var type: ProfileViewModelItemType {
        return .email
    }
    
    var sectionTitle: String {
        return "Email"
    }
    
}
