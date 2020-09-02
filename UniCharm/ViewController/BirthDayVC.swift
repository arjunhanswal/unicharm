//
//  BirthDayVC.swift
//  UniCharm
//
//  Created by Kavita on 13/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class BirthDayVC: UIViewController {
    @IBOutlet weak var tableView: UITableView!
    private let disposeBag = DisposeBag()
    var viewModel = DirectoryVM()
    override func viewDidLoad() {
        super.viewDidLoad()
        bindInput()
        bindOutput()
    }
    
    @IBAction func btnBack(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
}
extension BirthDayVC {
    private func bindInput() {
        
        viewModel
            .dataSource
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: EmployeeTableViewCell.reuseIdentifier, cellType: EmployeeTableViewCell.self)) { (index, data, cell) in
                
        }
        .disposed(by: disposeBag)
        
        tableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                
            }).disposed(by: disposeBag)
    }
    
    private func bindOutput() {
        
    }
}
