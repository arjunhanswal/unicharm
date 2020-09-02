//
//  Custom+UITextField.swift
//


import Foundation
import UIKit

private var kAssociationKeyMaxLength: Int = 0

extension UITextField {
  
  @IBInspectable var placeHolderCustomColor: UIColor? {
    get {
      return self.placeHolderCustomColor
    } set {
      self.attributedPlaceholder = NSAttributedString(string:self.placeholder != nil ? self.placeholder! : "", attributes:[NSAttributedString.Key.foregroundColor: newValue!])
    }
  }
  
  @IBInspectable var maxLength: Int {
    get {
      if let length = objc_getAssociatedObject(self, &kAssociationKeyMaxLength) as? Int {
        return length
      } else {
        return Int.max
      }
    }
    set {
      objc_setAssociatedObject(self, &kAssociationKeyMaxLength, newValue, .OBJC_ASSOCIATION_RETAIN)
      addTarget(self, action: #selector(checkMaxLength), for: .editingChanged)
    }
  }
  
  @objc func checkMaxLength(textField: UITextField) {
    guard let prospectiveText = self.text,
      prospectiveText.count > maxLength
      else {
        return
    }
    
    let selection = selectedTextRange
    
    let indexEndOfText = prospectiveText.index(prospectiveText.startIndex, offsetBy: maxLength)
    let substring = prospectiveText[..<indexEndOfText]
    text = String(substring)
    
    selectedTextRange = selection
  }
}

class TextField: UITextField {
  
  //** Set Left Pading of text field
  let padding = UIEdgeInsets(top: 0, left: 10, bottom: 0, right: 0)
  
  override func textRect(forBounds bounds: CGRect) -> CGRect {
    return newBounds(bounds)
  }
  
  override func placeholderRect(forBounds bounds: CGRect) -> CGRect {
    return newBounds(bounds)
  }
  
  override func editingRect(forBounds bounds: CGRect) -> CGRect {
    return newBounds(bounds)
  }
  
  private func newBounds(_ bounds: CGRect) -> CGRect {
    
    var newBounds = bounds
    newBounds.origin.x += padding.left
    newBounds.origin.y += padding.top
    newBounds.size.height -= padding.top + padding.bottom
    newBounds.size.width -= padding.left + padding.right
    return newBounds
  }
}
