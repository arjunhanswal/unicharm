//
//  NoticeBoardController.swift
//  UniCharm
//
//  Created by aanad on 04/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class NoticeBoardController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var lblNoticeBoard: UILabel!
    @IBOutlet weak var tableNoticeList: UITableView!
 
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func back(_ sender: Any) {
        
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func search(_ sender: Any) {
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableNoticeList.dequeueReusableCell(withIdentifier: "NoticeBoardTableCell") as! NoticeBoardTableCell
        return cell
    }
  
}
