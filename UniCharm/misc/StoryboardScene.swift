//
//  StoryboardScene.swift
//
//

import Foundation
import UIKit

class StoryboardScene {
  
  static let Main: UIStoryboard = {
    return UIStoryboard(name: "Main", bundle: nil)
  }()  
}

extension UIStoryboard {
  
  func controllerExists(withIdentifier: String) -> Bool {
    if let availableIdentifiers = self.value(forKey: "identifierToNibNameMap") as? [String: Any] {
      return availableIdentifiers[withIdentifier] != nil
    }
    
    return false
  }
  
  func instantiateViewController<VC: UIViewController>(withClass: VC.Type) -> VC {
    let identifier = NSStringFromClass(withClass as AnyClass).components(separatedBy: ".")[1]
    guard controllerExists(withIdentifier: identifier) else {
      fatalError("Failed to instantiate viewController")
    }
    
    return instantiateViewController(withIdentifier: identifier) as! VC
  }
}
