//
//  HomeVM.swift
//  UniCharm
//
//  Created by Kavita on 02/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit
import RxCocoa
import RxSwift

class HomeVM {
        let dataSource = BehaviorRelay<[String]>(value: ["Directory","HR Policy","Notice","Management Message","Birthdays","Photos"])
        let colorSource = BehaviorRelay<[UIColor]>(value: [#colorLiteral(red: 0.4705882353, green: 0.2901960784, blue: 0.9607843137, alpha: 1),#colorLiteral(red: 0.9764705882, green: 0.2901960784, blue: 0.5333333333, alpha: 1),#colorLiteral(red: 0.2156862745, green: 0.8509803922, blue: 0.8549019608, alpha: 1),#colorLiteral(red: 0.9607843137, green: 0.6705882353, blue: 0.2901960784, alpha: 1),#colorLiteral(red: 0.9764705882, green: 0.2901960784, blue: 0.5333333333, alpha: 1),#colorLiteral(red: 0.2156862745, green: 0.8509803922, blue: 0.8549019608, alpha: 1),#colorLiteral(red: 0.9607843137, green: 0.6705882353, blue: 0.2901960784, alpha: 1)])
        let categoryDataSource = BehaviorRelay<[String]>(value: ["Corporate News","upcoming events","Birthday"])
    }
