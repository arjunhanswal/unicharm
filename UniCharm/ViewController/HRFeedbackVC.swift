//
//  HRFeedbackVC.swift
//  UniCharm
//
//  Created by Namit Agrawal on 13/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class HRFeedbackVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    @IBAction func submit(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
