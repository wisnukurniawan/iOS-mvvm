//
//  ReusableView.swift
//  TableViewExample
//
//  Created by Wisnu on 3/4/18.
//  Copyright © 2018 Wisnu. All rights reserved.
//

import Foundation

import Foundation
import UIKit

protocol ReusableView: class {}

extension ReusableView where Self: UIView {
    static var reuseIdentifier: String {
        return String(describing: self)
    }
    
    static var nib:UINib {
        return UINib(nibName: reuseIdentifier, bundle: nil)
    }
}
