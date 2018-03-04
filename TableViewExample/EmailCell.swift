//
//  EmailCell.swift
//  TableViewExample
//
//  Created by Wisnu on 3/3/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import UIKit

class EmailCell: UITableViewCell {
    
    @IBOutlet weak var emailLabel: UILabel?
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? EmailItem else {
                return
            }
            
            emailLabel?.text = item.email
        }
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nib:UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
    
}
