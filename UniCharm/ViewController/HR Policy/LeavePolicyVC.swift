//
//  LeavePolicyVC.swift
//  UniCharm
//
//  Created by aanad on 04/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class LeavePolicyVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lblLastUpdate: UILabel!
    @IBOutlet weak var tabelLeavePolicyList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
   
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tabelLeavePolicyList.dequeueReusableCell(withIdentifier: "LeavePolicyTableCell") as! LeavePolicyTableCell
        return cell
    }
    
}
