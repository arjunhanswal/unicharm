//
//  HomeVC.swift
//  UniCharm
//
//  Created by Kavita on 02/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class HomeVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var newsCollectionView: UICollectionView!
    @IBOutlet var headerView: UIView!
    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var menuCollectionView: UICollectionView!
    
    private let disposeBag = DisposeBag()
    var viewModel = HomeVM()
    var selectedIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bindInput()
        bindOutput()
        
        tableView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
        
        menuCollectionView
            .rx.setDelegate(self)
            .disposed(by: disposeBag)
    }
}
extension HomeVC {
    private func bindInput() {
        viewModel
            .dataSource
            .asObservable()
            .bind(to: tableView.rx.items(cellIdentifier: HomeTableViewCell.reuseIdentifier, cellType: HomeTableViewCell.self)) { (index, data, cell) in
                
        }
        .disposed(by: disposeBag)
        
        viewModel
            .dataSource
            .asObservable()
            .bind(to: categoryCollectionView.rx.items(cellIdentifier: HomeCategoryCell.reuseIdentifier, cellType: HomeCategoryCell.self)) { (index, data, cell) in
                cell.configureCell(title: data)
                cell.bgImage.backgroundColor = self.viewModel.colorSource.value[index]
        }
        .disposed(by: disposeBag)
        
        
        viewModel
            .categoryDataSource
            .asObservable()
            .bind(to: menuCollectionView.rx.items(cellIdentifier: MenuCollectionViewCell.reuseIdentifier, cellType: MenuCollectionViewCell.self)) { (index, data, cell) in
                cell.lblTitlle.text = data
                cell.imgLine.isHidden = self.selectedIndex == index ? false : true
                cell.lblTitlle.textColor = self.selectedIndex == index ? #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) : #colorLiteral(red: 0.6980000138, green: 0.6980000138, blue: 0.6980000138, alpha: 1)
        }
        .disposed(by: disposeBag)
        
        
        viewModel
            .dataSource
            .asObservable()
            .bind(to: newsCollectionView.rx.items(cellIdentifier: NewsCollectionViewCell.reuseIdentifier, cellType: NewsCollectionViewCell.self)) { (index, data, cell) in
                
        }
        .disposed(by: disposeBag)
        
        menuCollectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                self?.selectedIndex = indexPath.row
                self?.viewModel.categoryDataSource.accept(["Corporate News","upcoming events","Birthday"])
            }).disposed(by: disposeBag)
        
        
        categoryCollectionView.rx.itemSelected
            .subscribe(onNext: { [weak self] indexPath in
                
                switch indexPath.row {
                case 0:
                    let viewController = StoryboardScene.Main.instantiateViewController(withClass: DirectoryVC.self)
                    self?.push(viewController)
                case 1:
                    let viewController = StoryboardScene.Main.instantiateViewController(withClass: HRPolicyController.self)
                    self?.push(viewController)
                case 2:
                    let viewController = StoryboardScene.Main.instantiateViewController(withClass: NoticeBoardController.self)
                    self?.push(viewController)
                    
                case 3:
                    let viewController = StoryboardScene.Main.instantiateViewController(withClass: ManagementController.self)
                    self?.push(viewController)
                case 4:
                    let viewController = StoryboardScene.Main.instantiateViewController(withClass: BirthDayVC.self)
                    self?.push(viewController)
                case 5:
                    let viewController = StoryboardScene.Main.instantiateViewController(withClass: PhotoVC.self)
                    self?.push(viewController)
                default:
                    break
                    
                }
            }).disposed(by: disposeBag)
        
    }
    
    private func bindOutput() {
        
    }
}
extension HomeVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 360
    }
}
extension HomeVC: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if newsCollectionView == collectionView  {
            return CGSize(width: collectionView.frame.width - 10 , height: 130)
        }else if menuCollectionView == collectionView {
            
            if let font = UIFont(name: "Poppins-SemiBold", size: 14) {
                let fontAttributes = [NSAttributedString.Key.font: font]
                let myText = viewModel.dataSource.value[indexPath.row]
                let size = (myText as NSString).size(withAttributes: fontAttributes)
                let finalSize = Int(truncating: size as? NSNumber ?? NSNumber.init(value: 1))
                return CGSize(width: finalSize, height: 60)
            }
        }
        return CGSize(width: 110, height: 130)
    }
}
