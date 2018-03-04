//
//  ProfileViewModelNamePictureItem.swift
//  TableViewExample
//
//  Created by Wisnu on 3/3/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import Foundation

class NamePictureItem: ProfileViewModelItem {
    
    var name: String
    var pictureUrl: String
    
    init(name: String, pictureUrl: String) {
        self.name = name
        self.pictureUrl = pictureUrl
    }
    
    var type: ProfileViewModelItemType {
        return .nameAndPicture
    }
    
    var sectionTitle: String {
        return "Main Info"
    }
}
