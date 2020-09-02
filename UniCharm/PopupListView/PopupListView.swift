//
//  PopupListView.swift
//
//  Created by Nishant tiwari on 04/12/19.
//  Copyright © 2019 Codiant Technology. All rights reserved.
//

import UIKit

class PopupListView: UIView {
    
    // MARK: - IBOutlet
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var tblList: UITableView!
    @IBOutlet private weak var contentView: UIView!
    @IBOutlet private weak var contentViewHeightConstraint: NSLayoutConstraint!
    
    // MARK: - Properties
    private var callbackSelectedIndex: ((String, Int) -> ())?
    private var list = [String]()
    private var filteredData = [String]()
    
    static func show(list: [String], Title title: String, completionHandler: @escaping (String, Int) -> Void) -> PopupListView {
        let popupListView = UINib(nibName: "PopupListView", bundle: nil).instantiate(withOwner: self).first as! PopupListView
        popupListView.lblTitle.text = title
        popupListView.setupTable()
        popupListView.callbackSelectedIndex = completionHandler
        popupListView.filteredData = list
        popupListView.list = list
        popupListView.frame = UIScreen.main.bounds
        let height = CGFloat(list.count * 50)
        popupListView.contentViewHeightConstraint.constant = (height < (UIScreen.main.bounds.height / 2)) ? height : (UIScreen.main.bounds.height / 2)
        popupListView.animatein()
        return popupListView
    }
    
    // MARK: - Initial Methods    
    private func setupTable() {
        tblList.registerCell(cellType: ListCell.self)
    }
    
    private func animatein() {
        alpha = 0
        guard let keyWindow = UIApplication.shared.keyWindow else { return }
        keyWindow.addSubview(self)
        UIView.animate(withDuration: 0.3) {
            self.alpha = 1
        }
    }
    
    private func animateOut() {
        UIView.animate(withDuration: 0.2, animations: {
            self.alpha = 0
        }) { _ in
            self.removeFromSuperview()
        }
    }
    
    // MARK: - IBAction Methods
    @IBAction private func btnCancel() {
        animateOut()
    }
}

// MARK: - UITableViewDelegate & UITableViewDataSource Methods

extension PopupListView: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueCell(cellType: ListCell.self)
        cell.lblName.text = filteredData[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        callbackSelectedIndex?(filteredData[indexPath.row], indexPath.row)
        animateOut()
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 40
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}
extension UITableView {
    
    func dequeueCell<T: UITableViewCell>(cellType: T.Type) -> T {
        let cell = self.dequeueReusableCell(withIdentifier: String(describing: cellType)) as! T
        return cell
    }
    
    func dequeueHeaderFooter<T: UITableViewHeaderFooterView>(viewType: T.Type) -> T {
        let view = self.dequeueReusableHeaderFooterView(withIdentifier:  String(describing: viewType)) as! T
        return view
    }
    
    func reloadDataInMain() {
        if Thread.isMainThread {
            self.reloadData()
        } else {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
    }
    
    func deleteRowWithIntexPath(_ indexPath: IndexPath) {
        let dispacthGroup = DispatchGroup()
        dispacthGroup.enter()
        DispatchQueue.main.async {
            self.deleteRows(at: [indexPath], with: .fade)
            dispacthGroup.leave()
        }
    }
    
    func deleteSectionWithIntexPath(_ indexPath: IndexPath) {
        let dispacthGroup = DispatchGroup()
        dispacthGroup.notify(queue: .main) {
            self.deleteSections(IndexSet.init(integer: indexPath.section), with: .fade)
        }
    }
    
    func registerCell<T: UITableViewCell>(cellType: T.Type) {
        let nib = UINib(nibName: String(describing: cellType.self), bundle: nil)
        let reuseIdentifier = String(describing: cellType.self)
        self.register(nib, forCellReuseIdentifier: reuseIdentifier)
    }
    
    func registerHeaderFooter<T: UITableViewHeaderFooterView>(cellType: T.Type) {
        let nib = UINib(nibName: String(describing: cellType.self), bundle: nil)
        let reuseIdentifier = String(describing: cellType.self)
        self.register(nib, forHeaderFooterViewReuseIdentifier: reuseIdentifier)
    }
    
    func hideTableInMain(isHidden: Bool) {
        DispatchQueue.main.async {
            self.isHidden = isHidden
        }
    }
}
