//
//  ManagementController.swift
//  UniCharm
//
//  Created by aanad on 04/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class ManagementController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lblManagementMessges: UILabel!
    @IBOutlet weak var tableManagementList: UITableView!
    
    var responseData = ["Leave Notice","Company Notice","HRM Notice","Allowance Notice","WFH Notice","Holiday's Notice","PF Notice","Leave Notice"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func back(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)

    }
    
    @IBAction func search(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
          return responseData.count
      }
      
      func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
          
          let cell = tableManagementList.dequeueReusableCell(withIdentifier: "NoticeBoardTableCell") as! NoticeBoardTableCell
            return cell
      }
      
      func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
              
          let next = self.storyboard?.instantiateViewController(withIdentifier: "MessageDetialsVC") as! MessageDetialsVC

          self.navigationController?.pushViewController(next, animated: true)
      }
    

}
