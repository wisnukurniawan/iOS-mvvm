//
//  ProfilePresenter.swift
//  TableViewExample
//
//  Created by Wisnu on 3/3/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import Foundation

class ProfilePresenter {
    
    let serverRequestManager: ServerRequestManager!
    
    init(serverRequestManager: ServerRequestManager) {
        self.serverRequestManager = serverRequestManager
    }
    
    func loadProfile() -> Data? {
        return serverRequestManager.dataFromFile("ServerData")
    }
    
    func setupItems(fromProfile profile: Profile) -> [ProfileViewModelItem] {
        var items = [ProfileViewModelItem]()
        
        if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
            let nameAndPictureItem = ProfileViewModelNamePictureItem(name: name, pictureUrl: pictureUrl)
            items.append(nameAndPictureItem)
        }
        
        if let about = profile.about {
            let aboutItem = ProfileViewModelAboutItem(about: about)
            items.append(aboutItem)
        }
        
        if let email = profile.email {
            let dobItem = ProfileViewModelEmailItem(email: email)
            items.append(dobItem)
        }
        
        let attributes = profile.profileAttributes
        if !attributes.isEmpty {
            let attributesItem = ProfileViewModelAttributeItem(attributes: attributes)
            items.append(attributesItem)
        }
        
        let friends = profile.friends
        if !profile.friends.isEmpty {
            let friendsItem = ProfileViewModelFriendsItem(friends: friends)
            items.append(friendsItem)
        }
        
        return items
    }
    
}
