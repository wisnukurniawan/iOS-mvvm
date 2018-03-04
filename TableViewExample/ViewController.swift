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
    
    var friendsItem: FriendsItem!
    var attributesItem: AttributeItem!
    var emailItem: EmailItem!
    var aboutItem: AboutItem!
    var namePictureItem: NamePictureItem!
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        guard let data = server.dataFromFile("ServerData"), let profile = Profile(data: data) else {
            return
        }
        
        if let name = profile.fullName, let pictureUrl = profile.pictureUrl {
            namePictureItem = NamePictureItem(name: name, pictureUrl: pictureUrl)
        }
        
        if let about = profile.about {
            aboutItem = AboutItem(about: about)
        }
        
        if let email = profile.email {
            emailItem = EmailItem(email: email)
        }
        
        let attributes = profile.profileAttributes
        if !attributes.isEmpty {
            attributesItem = AttributeItem(attributes: attributes)
        }
        
        let friends = profile.friends
        if !profile.friends.isEmpty {
            friendsItem = FriendsItem(friends: friends)
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
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 3:
            return attributesItem.attributes.count
        case 4:
            return friendsItem.friends.count
        default:
            return 1
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch indexPath.section {
        case 0:
            if let cell = tableView.dequeueReusableCell(withIdentifier: NamePictureCell.reuseIdentifier, for: indexPath) as? NamePictureCell {
                cell.nameLabel?.text = namePictureItem.name
                cell.pictureImageView?.image = UIImage(named: namePictureItem.pictureUrl)
                return cell
            }
        case 1:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AboutCell.reuseIdentifier, for: indexPath) as? AboutCell {
                cell.aboutLabel?.text = aboutItem.about
                return cell
            }
        case 2:
            if let cell = tableView.dequeueReusableCell(withIdentifier: EmailCell.reuseIdentifier, for: indexPath) as? EmailCell {
                cell.emailLabel?.text = emailItem.email
                return cell
            }
        case 3:
            if let cell = tableView.dequeueReusableCell(withIdentifier: AttributeCell.reuseIdentifier, for: indexPath) as? AttributeCell {
                cell.item = attributesItem.attributes[indexPath.row]
                return cell
            }
        default:
            if let cell = tableView.dequeueReusableCell(withIdentifier: FriendCell.reuseIdentifier, for: indexPath) as? FriendCell {
                let friend = friendsItem.friends[indexPath.row]
                cell.item = friend
                return cell
            }
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Main Info"
        case 1:
            return "About"
        case 2:
            return "Email"
        case 3:
            return "Attributes"
        default:
            return "Friends"
        }
    }
}

