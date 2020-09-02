//
//  CompanyNoticeVC.swift
//  UniCharm
//
//  Created by aanad on 04/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class CompanyNoticeVC: UIViewController, UITableViewDataSource, UITableViewDelegate  {
    @IBOutlet weak var tblCmpnyNoticeList: UITableView!
    
    var responseData = ["1. Using Our Services","2. Your Account","3. Leave policy"]
    
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
        
        let cell = tblCmpnyNoticeList.dequeueReusableCell(withIdentifier: "PolicyListTableCell") as! PolicyListTableCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
    
}
