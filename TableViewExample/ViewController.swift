//
//  ViewController.swift
//  TableViewExample
//
//  Created by Wisnu on 3/1/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let server = ServerRequestManager()
    
    var items = [ProfileViewModelItem]()
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        
        tableView?.dataSource = self
        
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableViewAutomaticDimension
        
        tableView?.register(AboutCell.nib, forCellReuseIdentifier: AboutCell.reuseIdentifier)
        tableView?.register(NamePictureCell.nib, forCellReuseIdentifier: NamePictureCell.reuseIdentifier)
        tableView?.register(FriendCell.nib, forCellReuseIdentifier: FriendCell.reuseIdentifier)
        tableView?.register(AttributeCell.nib, forCellReuseIdentifier: AttributeCell.reuseIdentifier)
        tableView?.register(EmailCell.nib, forCellReuseIdentifier: EmailCell.reuseIdentifier)
    }


}

extension ViewController: UITableViewDataSource {
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
                let namePictureItem = item as? NamePictureItem
                cell.nameLabel?.text = namePictureItem?.name
                cell.pictureImageView?.image = UIImage(named: (namePictureItem?.pictureUrl)!)
                return cell
            }
        case .about:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.reuseIdentifier, for: indexPath) as? AboutCell {
                let aboutItem = item as? AboutItem
                cell.aboutLabel?.text = aboutItem?.about
                return cell
            }
        case .email:
            if let cell = tableView.dequeueReusableCell(withIdentifier: EmailCell.reuseIdentifier, for: indexPath) as? EmailCell {
                let emailItem = item as? EmailItem
                cell.emailLabel?.text = emailItem?.email
                return cell
            }
        case .attribute:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AttributeCell.reuseIdentifier, for: indexPath) as? AttributeCell {
                let attributesItem = item as? AttributeItem
                cell.item = attributesItem?.attributes[indexPath.row]
                return cell
            }
        case .friend:
            if let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.reuseIdentifier, for: indexPath) as? FriendCell {
                let friendsItem = item as? FriendsItem
                let friend = friendsItem?.friends[indexPath.row]
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

