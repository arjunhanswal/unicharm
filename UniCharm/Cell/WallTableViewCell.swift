//
//  WallTableViewCell.swift
//  UniCharm
//
//  Created by Kavita on 03/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class WallTableViewCell: UITableViewCell {
    static let reuseIdentifier = "WallTableViewCell"
    
    @IBOutlet weak var btnMore: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
