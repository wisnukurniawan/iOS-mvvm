//
//  AttributeCell.swift
//  TableViewExample
//
//  Created by Wisnu on 3/3/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import UIKit

class AttributeCell: UITableViewCell {
    
    @IBOutlet weak var titleLabel: UILabel?
    @IBOutlet weak var valueLabel: UILabel?
    
    var item: Attribute?  {
        didSet {
            titleLabel?.text = item?.key
            valueLabel?.text = item?.value
        }
    }
    
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nib:UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
    
}