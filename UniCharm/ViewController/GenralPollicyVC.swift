//
//  GenralPollicyVC.swift
//  UniCharm
//
//  Created by Kavita on 16/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class GenralPollicyVC: UIViewController {
    let dataSource = BehaviorRelay<[String]>(value: [ "Brief & Purpose", "Attendance",  "Public Image",  "Building Security",  "Health-Related Issues",  "Employment Relationship"])

   @IBOutlet weak var tableView: UITableView!
    private let disposeBag = DisposeBag()
 
    override func viewDidLoad() {
        super.viewDidLoad()
        bindInput()
        bindOutput()
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension GenralPollicyVC {
    private func bindInput() {
     
           dataSource
                .asObservable()
                .bind(to: tableView.rx.items(cellIdentifier: "NoticeBoardTableCell", cellType: NoticeBoardTableCell.self)) { (index, data, cell) in
                    cell.lblNoticeName.text  = data
            }
            .disposed(by: disposeBag)
     
    }
    
    private func bindOutput() {
        
    }
    
}
