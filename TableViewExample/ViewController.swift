//
//  ViewController.swift
//  TableViewExample
//
//  Created by Wisnu on 3/1/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let viewModel = ProfileViewModel()
    
    @IBOutlet weak var tableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView?.dataSource = viewModel
        
        tableView?.estimatedRowHeight = 100
        tableView?.rowHeight = UITableViewAutomaticDimension
        
        tableView?.register(AboutCell.nib, forCellReuseIdentifier: AboutCell.reuseIdentifier)
        tableView?.register(NamePictureCell.nib, forCellReuseIdentifier: NamePictureCell.reuseIdentifier)
        tableView?.register(FriendCell.nib, forCellReuseIdentifier: FriendCell.reuseIdentifier)
        tableView?.register(AttributeCell.nib, forCellReuseIdentifier: AttributeCell.reuseIdentifier)
        tableView?.register(EmailCell.nib, forCellReuseIdentifier: EmailCell.reuseIdentifier)
    }

}

