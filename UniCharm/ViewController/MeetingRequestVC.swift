//
//  MeetingRequestVC.swift
//  UniCharm
//
//  Created by Namit Agrawal on 11/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class MeetingRequestVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var responseData = ["Jupiter Room", "Pluto Room", "Star Room", "Mercury Room", "Venus Room"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func next(_ sender: Any) {
        let viewController = StoryboardScene.Main.instantiateViewController(withClass: MeetingRequestStep2VC.self)
        self.push(viewController)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeBoardTableCell") as! NoticeBoardTableCell
        cell.lblNoticeName.text = responseData[indexPath.row]
        cell.colorView.backgroundColor = indexPath.row % 2 == 0 ? #colorLiteral(red: 0.4705882353, green: 0.2901960784, blue: 0.9607843137, alpha: 1) : #colorLiteral(red: 0.9764705882, green: 0.2901960784, blue: 0.5333333333, alpha: 1)
        return cell
    }
}
