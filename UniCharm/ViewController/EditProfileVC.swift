//
//  EditProfileVC.swift
//  UniCharm
//
//  Created by Namit Agrawal on 16/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class EditProfileVC: UIViewController {
    
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
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}
