//
//  HomeCategoryCell.swift
//  UniCharm
//
//  Created by Kavita on 02/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class HomeCategoryCell: UICollectionViewCell {
    
    @IBOutlet weak var bgImage: UIImageView!
    @IBOutlet weak var lblTitle: UILabel!
    static let reuseIdentifier = "HomeCategoryCell"
    
    func configureCell(title: String) {
        lblTitle.text = title
    }
}
