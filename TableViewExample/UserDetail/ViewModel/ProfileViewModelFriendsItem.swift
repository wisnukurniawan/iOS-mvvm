//
//  ProfileViewModelFriendsItem.swift
//  TableViewExample
//
//  Created by Wisnu on 3/3/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import Foundation

class ProfileViewModelFriendsItem: ProfileViewModelItem {
    var type: ProfileViewModelItemType {
        return .friend
    }
    
    var sectionTitle: String {
        return "Friends"
    }
    
    var rowCount: Int {
        return friends.count
    }
    
    var friends: [Friend]
    
    init(friends: [Friend]) {
        self.friends = friends
    }
}
