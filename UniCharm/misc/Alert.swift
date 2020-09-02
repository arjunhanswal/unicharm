//
//  Alert.swift
//  ReactVendor
//
//  Created by Namit Agrawal on 28/11/19.
//  Copyright © 2019 Codiant Technology. All rights reserved.
//

import UIKit

struct Alert {
    
    var title: String?
    var message: String?
    var handler: (() -> ())?
    
    init(title: String? = "Unicharm", message: String?, handler: (() -> ())? = nil) {
        self.title = title
        self.message = message
        self.handler = handler
    }
    
    static func network() -> Alert {
        return self.init(title: "No Network Connection", message: "Please check your connection and try again.")
    }
    
    static func showNetworkAlert(handler: (() -> ())? = nil) {
        showAlertWithMessage("Please check your connection and try again.", title: "No Network Connection", buttonTitle: "Retry", handler: handler)
    }
    
    static func showAlertWithMessage(_ message: String, title: String?, buttonTitle: String = "OK", handler:(() -> ())? = nil) {
        //** If any Alert view is alrady presented then do not show another alert
        var viewController: UIViewController!
        if Thread.isMainThread {
            if let vc = UIApplication.topViewController() {
                if (vc.isKind(of: UIAlertController.self)) {
                    return
                } else {
                    viewController = vc
                }
            } else {
               // viewController = Constant.Application.delegate.window?.rootViewController!
            }
            
            let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default) { (_) in
                handler?()
            })
            viewController!.present(alert, animated: true)
        } else {
            DispatchQueue.main.sync {
                if let vc = UIApplication.topViewController() {
                    if (vc.isKind(of: UIAlertController.self)) {
                        return
                    } else {
                        viewController = vc
                    }
                } else {
                   // viewController = Constant.Application.delegate.window?.rootViewController!
                }
                
                let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
                alert.addAction(UIAlertAction(title: buttonTitle, style: UIAlertAction.Style.default) { (_) in
                    handler?()
                })
                viewController!.present(alert, animated: true)
            }
        }
    }
    
    static func alertController(title:String, message: String, firstButtonTitle: String , secondButtonTitle: String , completion:@escaping (_ result: Bool) -> Void) {
        var viewController: UIViewController!
        if let vc = UIApplication.topViewController() {
            if (vc.isKind(of: UIAlertController.self)) {
                return
            } else {
                viewController = vc
            }
        } else {
            //viewController = Constant.Application.delegate.window?.rootViewController!
        }
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        viewController!.present(alert, animated: true, completion: nil)
        
        alert.addAction(UIAlertAction(title: firstButtonTitle, style: .default, handler: { action in
            completion(true)
        }))
        
        alert.addAction(UIAlertAction(title: secondButtonTitle, style: .cancel, handler: { action in
            completion(false)
        }))
    }
    
    static func showLoginAlert(handler:(() -> ())? = nil) {
        //** If any Alert view is alrady presented then do not show another alert
        var viewController: UIViewController!
        if let vc = UIApplication.topViewController() {
            if (vc.isKind(of: UIAlertController.self)) {
                return
            } else {
                viewController = vc
            }
        } else {
           // viewController = Constant.Application.delegate.window?.rootViewController!
        }
        
        
        let alertController = UIAlertController(title: "Unicharm", message: "Please login first!", preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: "Login", style: .default) { _ in
            handler?()
        })
        
        alertController.addAction(UIAlertAction(title: "Cancel", style: .cancel))
        viewController!.present(alertController, animated: true)
    }
}
extension UIApplication {
    
    static func topViewController(_ base: UIViewController? = UIApplication.shared.keyWindow?.rootViewController) -> UIViewController? {
        
        if let nav = base as? UINavigationController {
            if Thread.isMainThread {
                return topViewController(nav.visibleViewController)
            } else {
                _ = DispatchQueue.main.sync(execute: {
                    return topViewController(nav.visibleViewController)
                })
            }
        }
        
        if let tab = base as? UITabBarController, let selected = tab.selectedViewController {
            
            return topViewController(selected)
        }
        
        if let presented = base?.presentedViewController {
            
            return topViewController(presented)
        }
        return base
    }
}
