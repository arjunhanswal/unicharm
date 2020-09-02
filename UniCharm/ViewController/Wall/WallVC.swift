//
//  WallViewController.swift
//  UniCharm
//
//  Created by Kavita on 03/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class WallVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    private let disposeBag = DisposeBag()
    var viewModel = HomeVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bindInput()
    }
    @objc func showAlert(sender: UIButton) {
        let alert = UIAlertController(title: "", message: "Please Select an Option", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Pin post to post", style: .default , handler:{ (UIAlertAction)in
            print("User click Approve button")
        }))
        
        alert.addAction(UIAlertAction(title: "Hide from my Feed", style: .default , handler:{ (UIAlertAction)in
            print("User click Edit button")
        }))
        
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel , handler:{ (UIAlertAction)in
            print("User click Edit button")
        }))
        
        self.present(alert, animated: true, completion: {
            print("completion block")
        })
    }
}
extension WallVC {
    private func bindInput() {
        viewModel
            .dataSource
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: WallTableViewCell.reuseIdentifier, cellType: WallTableViewCell.self)) { (index, data, cell) in
                cell.btnMore.addTarget(self, action: #selector(self.showAlert(sender:)), for: .touchUpInside)
        }
        .disposed(by: disposeBag)
        
    }
    
    private func bindOutput() {
        
    }
}
