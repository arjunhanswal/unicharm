//
//  DirectoryVM.swift
//  UniCharm
//
//  Created by Kavita on 12/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa

class DirectoryVM: NSObject {
   
    
    let dataSource = BehaviorRelay<[String]>(value: ["Corporate News","upcoming events","Birthday","Corporate News","upcoming events","Birthday"])
    
    let dataSource1 = BehaviorRelay<[String]>(value: ["Compliance with law", "Respect in the workplace", "Protection of company property", "Professionalism at the workplace", "Job duties and authority"])
    
     let dataSource2 = BehaviorRelay<[String]>(value: [" Brief & Purpose", "Attendance",  "Public Image", " Building Security",  "Health-Related Issues",  "Employment Relationship"])
}
