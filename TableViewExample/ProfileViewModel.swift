//
//  ProfileViewModel.swift
//  TableViewExample
//
//  Created by Wisnu on 3/4/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import Foundation
import UIKit

class ProfileViewModel: NSObject {
    lazy var server = ServerRequestManager()

    var items = [ProfileViewModelItem]()
    
    override init() {
        super.init()

        guard let data = server.dataFromFile("ServerData"), let profile = Profile(data: data) else {
            return
        }
        
        if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
            let namePictureItem = NamePictureItem(name: name, pictureUrl: pictureUrl)
            items.append(namePictureItem)
        }
        
        if let about = profile.about {
            let aboutItem = AboutItem(about: about)
            items.append(aboutItem)
        }
        
        if let email = profile.email {
            let emailItem = EmailItem(email: email)
            items.append(emailItem)
        }
        
        let attributes = profile.profileAttributes
        if !attributes.isEmpty {
            let attributesItem = AttributeItem(attributes: attributes)
            items.append(attributesItem)
        }
        
        let friends = profile.friends
        if !profile.friends.isEmpty {
            let friendsItem = FriendsItem(friends: friends)
            items.append(friendsItem)
        }
        
    }
}


extension ProfileViewModel: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items[section].rowCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let item = items[indexPath.section]
        switch item.type {
        case .nameAndPicture:
            if let cell = tableView.dequeueReusableCell(withIdentifier: NamePictureCell.reuseIdentifier, for: indexPath) as? NamePictureCell {
                cell.item = item
                return cell
            }
        case .about:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.reuseIdentifier, for: indexPath) as? AboutCell {
                cell.item = item
                return cell
            }
        case .email:
            if let cell = tableView.dequeueReusableCell(withIdentifier: EmailCell.reuseIdentifier, for: indexPath) as? EmailCell {
                cell.item = item
                return cell
            }
        case .attribute:
            if let item = item as? AttributeItem, let cell = tableView.dequeueReusableCell(withIdentifier: AttributeCell.reuseIdentifier, for: indexPath) as? AttributeCell {
                cell.item = item.attributes[indexPath.row]
                return cell
            }
        case .friend:
            if let item = item as? FriendsItem, let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.reuseIdentifier, for: indexPath) as? FriendCell {
                let friend = item.friends[indexPath.row]
                cell.item = friend
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return items[section].sectionTitle
    }
}
