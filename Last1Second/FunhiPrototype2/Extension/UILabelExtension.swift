//
//  UILabelExtension.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/19.
//

import UIKit

extension UILabel {

  func setLineSpacing(lineSpacing: CGFloat) {
    guard let labelText = self.text else { return }
    
    let paragraphStyle = NSMutableParagraphStyle()
    paragraphStyle.lineSpacing = lineSpacing
    let attributedString:NSMutableAttributedString
    if let labelattributedText = self.attributedText {
      attributedString = NSMutableAttributedString(attributedString: labelattributedText)
    } else {
      attributedString = NSMutableAttributedString(string: labelText)
    }
    attributedString.addAttribute(NSAttributedString.Key.paragraphStyle, value:paragraphStyle, range:NSMakeRange(0, attributedString.length))
    self.attributedText = attributedString
  }
  
  func setCharacterSpacing(characterSpacing: CGFloat) {
    guard let selfText = self.text else { return }
    let attributedString = NSMutableAttributedString(string: selfText)
    attributedString.addAttribute(NSAttributedString.Key.kern, value: characterSpacing, range: NSRange(location: 0, length: attributedString.length))
    self.attributedText = attributedString
  }
}
