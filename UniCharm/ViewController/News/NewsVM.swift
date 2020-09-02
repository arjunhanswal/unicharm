//
//  NewsVM.swift
//  UniCharm
//
//  Created by Kavita on 12/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class NewsVM: NSObject {
    let dataSource = BehaviorRelay<[String]>(value: ["Corporate News","upcoming events","Birthday"])
}
