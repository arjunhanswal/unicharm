//
//  UIViewController+Extension.swift
//

import UIKit

extension UIViewController {
  
  func push(_ viewController: UIViewController, animated: Bool = true) {
    navigationController?.pushViewController(viewController, animated: animated)
  }
  
  func pop(animated: Bool = true) {
    navigationController?.popViewController(animated: animated)
  }
  
  
  func popToRoot() {
      navigationController?.popToRootViewController(animated: true)
  }
  
  func popToSpecificController(_ viewController: AnyClass) {
    for controller in self.navigationController!.viewControllers as Array {
      if controller.isKind(of: viewController) {
        _ =  navigationController!.popToViewController(controller, animated: true)
        break
      }
    }
  }
  
  func present(_ viewController: UIViewController, animated: Bool = true) {
    present(viewController, animated: animated, completion: nil)
  }
  
  func dismiss(animated: Bool = true) {
    dismiss(animated: animated, completion: nil)
  }
  
  func showAlertWith(message: String, cancelButtonCallback: (() -> Void)? = nil) {
    let alertController = UIAlertController(title: Application.name, message: message, preferredStyle: .alert)
    alertController.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { (action) in
      cancelButtonCallback?()
    }))
    present(alertController, animated: true, completion: nil)
  }
  
  func add(_ child: UIViewController, frame: CGRect? = nil) {
    addChild(child)
    if let frame = frame {
      child.view.frame = frame
    }
    view.addSubview(child.view)
    child.didMove(toParent: self)
  }
  
  func remove() {
    willMove(toParent: nil)
    view.removeFromSuperview()
    removeFromParent()
  }
  
  func present(_ viewController: UIViewController, animated: Bool = true, presentationStyle: UIModalPresentationStyle, transitionStyle: UIModalTransitionStyle) {
    DispatchQueue.main.async {
      viewController.modalPresentationStyle = presentationStyle
      viewController.modalTransitionStyle = transitionStyle
      self.present(viewController, animated: animated, completion: nil)
    }
  }
}
