//
//  HRPolicyController.swift
//  UniCharm
//
//  Created by aanad on 04/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class HRPolicyController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lblTotalPolicy: UILabel!
    @IBOutlet weak var tablePolicyList: UITableView!
    
    var responseData = ["Non-Discrimination", "Non-Disclosure/Confidentiality", "New Employee Orientation", "Hours of Operation", "Personnel Data Changes", "Inclement Weather/Emergency Closing", "Employment Termination, Safety", "Employee Requiring Medical Attention", "Insurance of Personal Effects"]//["Leave Policy","Company Policy","HRM Policy","Allowance Policy","WFH Policy","Holiday's Policy","PF Policy","Leave Approved Policy"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    @IBAction func back(_ sender: Any) {
        pop()
    }
    
    @IBAction func search(_ sender: Any) {
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tablePolicyList.dequeueReusableCell(withIdentifier: "PolicyListTableCell") as! PolicyListTableCell
        cell.lblPolicyType.text = responseData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let next = self.storyboard?.instantiateViewController(withIdentifier: "LeavePolicyVC") as! LeavePolicyVC
        self.navigationController?.pushViewController(next, animated: true)
    }
    
}
