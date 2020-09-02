//
//  MoreVC.swift
//  UniCharm
//
//  Created by Namit Agrawal on 09/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class MoreVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    

    var responseData = ["What's New in Unicham", "HR Policies", "Code of Conduct", "General Policies", "Notice Board", "Surveys", "HR Feedback", "Work anniversary", "Management Message", "News", "Events", "Birthdays", "Request for Meeting room","Meeting room status", "Upcoming Holidays"]
  
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func viewProfileActionMethon(_ sender: Any) {
           let viewController = StoryboardScene.Main.instantiateViewController(withClass: EditProfileVC.self)
           self.push(viewController)
       }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return responseData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "NoticeBoardTableCell") as! NoticeBoardTableCell
        cell.lblNoticeName.text = responseData[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        switch responseData[indexPath.row] {
        case "HR Policies":
            let viewController = StoryboardScene.Main.instantiateViewController(withClass: HRPolicyController.self)
            self.push(viewController)
        case "Notice Board":
            let viewController = StoryboardScene.Main.instantiateViewController(withClass: NoticeBoardController.self)
            self.push(viewController)
        case "News":
            let viewController = StoryboardScene.Main.instantiateViewController(withClass: NewsVC.self)
            self.push(viewController)
        case "Management Message":
            let viewController = StoryboardScene.Main.instantiateViewController(withClass: ManagementController.self)
            self.push(viewController)
        case "Events":
            let viewController = StoryboardScene.Main.instantiateViewController(withClass: PhotoVC.self)
            self.push(viewController)
        case "Request for Meeting room":
            let viewController = StoryboardScene.Main.instantiateViewController(withClass: MeetingRequestVC.self)
            self.push(viewController)
        case "Meeting room status":
            let viewController = StoryboardScene.Main.instantiateViewController(withClass: MeetingRoomStatusVC.self)
            self.push(viewController)

        case "Birthdays":
            let viewController = StoryboardScene.Main.instantiateViewController(withClass: DirectoryVC.self)
            self.push(viewController)
        case "Upcoming Holidays":
            let viewController = StoryboardScene.Main.instantiateViewController(withClass: DirectoryVC.self)
            self.push(viewController)
        case "Code of Conduct":
            let viewController = StoryboardScene.Main.instantiateViewController(withClass: CodeofConductVC.self)
            self.push(viewController)
        case "Surveys":
            Alert.showAlertWithMessage("Comming soon", title: "")
        case "HR Feedback":
            let viewController = StoryboardScene.Main.instantiateViewController(withClass: HRFeedbackVC.self)
            self.push(viewController)
        case "General Policies":
            let viewController = StoryboardScene.Main.instantiateViewController(withClass: GenralPollicyVC.self)
            self.push(viewController)
        default:
            break
        }
    }
}
