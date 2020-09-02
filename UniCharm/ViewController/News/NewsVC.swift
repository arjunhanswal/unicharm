//
//  NewsVC.swift
//  UniCharm
//
//  Created by Kavita on 12/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsVC: UIViewController {
    @IBOutlet weak var newsTableView: UITableView!
    private let disposeBag = DisposeBag()
    var viewModel = NewsVM()
   
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindInput()
        bindOutput()
    }
    @IBAction func btnBack(_ sender: Any) {
        self.pop()
    }
}
extension NewsVC {
    private func bindInput() {
        
        viewModel
            .dataSource
            .asObservable()
            .bind(to: newsTableView.rx.items(cellIdentifier: NewsTableViewCell.reuseIdentifier, cellType: NewsTableViewCell.self)) { (index, data, cell) in
                
        }
        .disposed(by: disposeBag)
        
        newsTableView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                let viewController = StoryboardScene.Main.instantiateViewController(withClass: NewsDetialsVC.self)
                self?.push(viewController)
            }).disposed(by: disposeBag)
    }
    
    private func bindOutput() {
        
    }
}
