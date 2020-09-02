//
//  NoticeBoardTableCell.swift
//  UniCharm
//
//  Created by aanad on 04/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class NoticeBoardTableCell: UITableViewCell {

    @IBOutlet weak var lblNoticeName: UILabel!
    @IBOutlet weak var lblDescreption: UILabel!
    @IBOutlet weak var cellButton: UIButton!

    @IBOutlet weak var colorView: UIView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }

}
