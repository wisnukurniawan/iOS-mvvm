//
//  NamePictureCell.swift
//  TableViewExample
//
//  Created by Wisnu on 3/3/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import UIKit

class NamePictureCell: UITableViewCell, ReusableView {

    @IBOutlet weak var nameLabel: UILabel?
    @IBOutlet weak var pictureImageView: UIImageView?
    
    var item: ProfileViewModelItem? {
        didSet {
            guard let item = item as? ProfileViewModelNamePictureItem else {
                return
            }
            
            nameLabel?.text = item.name
            pictureImageView?.image = UIImage(named: item.pictureUrl)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        pictureImageView?.layer.cornerRadius = 50
        pictureImageView?.clipsToBounds = true
        pictureImageView?.contentMode = .scaleAspectFit
        pictureImageView?.backgroundColor = UIColor.lightGray
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        
        pictureImageView?.image = nil
    }
}
