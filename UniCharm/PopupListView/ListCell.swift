//
//  ListCell.swift
//  ReactVendor
//
//  Created by Nishant tiwari on 05/12/19.
//  Copyright © 2019 Codiant Technology. All rights reserved.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }
}
