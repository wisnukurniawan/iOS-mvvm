//
//  ProfileViewModelAboutItem.swift
//  TableViewExample
//
//  Created by Wisnu on 3/3/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import Foundation

class AboutItem: ProfileViewModelItem {
    
    var about: String
    
    init(about: String) {
        self.about = about
    }
    
    var type: ProfileViewModelItemType {
        return .about
    }
    
    var sectionTitle: String {
        return "About"
    }
}
