//
//  BirthYearVC.swift
//  UniCharm
//
//  Created by Kavita on 12/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

class BirthYearVC: UIViewController,UIPickerViewDelegate {

    @IBOutlet weak var txtYear: UITextField!
    var toolBar = UIToolbar()
    var picker  = UIPickerView()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func btnBack(_ sender: Any) {
    }
    @IBAction func btnYear(_ sender: Any) {
        var date: Date!
        var expirationDate: Date!
        let calendar = Calendar.current
        let dateComponents = DateComponents(calendar: calendar,
                                            year: Int(Date().getFormattedCurrentDate(.year)),
                                            month: 10,
                                            day: 10)
        
        // DateComponents as a date specifier
        let Currentdate = calendar.date(from: dateComponents)!
        
        date = Calendar.current.date(byAdding: .year, value: -100, to: Currentdate)!
        expirationDate = Calendar.current.date(byAdding: .year, value: 0, to: Currentdate)!
        
        let yearsArray = Date.years(from: date, to: expirationDate, outputFormat: .year)
        _ = PopupListView.show(list: yearsArray, Title: "Select Year", completionHandler: { (str, index) in
            self.txtYear.text = str
        })
    }
    @IBAction func btnNext(_ sender: Any) {
        
    }
    
   
}
