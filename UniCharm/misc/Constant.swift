//
//  Constant.swift
//  UniCharm
//
//  Created by Namit Agrawal on 09/08/20.
//  Copyright © 2020 Kavita. All rights reserved.
//

import UIKit

enum Application {
  static let name = "UniCharm"
  static let type = "ios"
  static let bundleIdentifier = Bundle.main.bundleIdentifier!
  static let delegate = UIApplication.shared.delegate as! AppDelegate
  static let certificationType = "development"
  
  //Applicatipn keyWindow
  static var keyWindow: UIWindow {
    return UIApplication.shared.keyWindow!
  }
}
