//
//  AboutCell.swift
//  TableViewExample
//
//  Created by Wisnu on 3/3/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import UIKit

class AboutCell: UITableViewCell, ReusableView {
    
    @IBOutlet weak var aboutLabel: UILabel?
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelAboutItem else {
                return
            }
            
            aboutLabel?.text = item.about
        }
    }

}
