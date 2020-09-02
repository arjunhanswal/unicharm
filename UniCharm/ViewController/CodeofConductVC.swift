//
//  CodeofConductVC.swift
//  UniCharm
//
//  Created by Kavita on 12/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
class CodeofConductVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    private let disposeBag = DisposeBag()
    var viewModel = DirectoryVM()
    var poloicy = false
    override func viewDidLoad() {
        super.viewDidLoad()
        bindInput()
        bindOutput()
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension CodeofConductVC {
    private func bindInput() {
     
            viewModel
                .dataSource1
                .asObservable()
                .bind(to: tableView.rx.items(cellIdentifier: "NoticeBoardTableCell", cellType: NoticeBoardTableCell.self)) { (index, data, cell) in
                    cell.lblNoticeName.text  = data
            }
            .disposed(by: disposeBag)
     
    }
    
    private func bindOutput() {
        
    }
    
}
