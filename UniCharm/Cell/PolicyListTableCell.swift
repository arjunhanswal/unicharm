//
//  PolicyListTableCell.swift
//  UniCharm
//
//  Created by aanad on 04/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class PolicyListTableCell: UITableViewCell {

    @IBOutlet weak var imgCell: UIImageView!
    @IBOutlet weak var lblPolicyType: UILabel!
    @IBOutlet weak var lblDate: UILabel!
    @IBOutlet weak var cellButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
