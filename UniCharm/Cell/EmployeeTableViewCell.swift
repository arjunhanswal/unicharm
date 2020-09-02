//
//  EmployeeTableViewCell.swift
//  UniCharm
//
//  Created by Kavita on 12/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    static let reuseIdentifier = "EmployeeTableViewCell"
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
