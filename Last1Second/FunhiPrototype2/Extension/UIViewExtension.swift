//
//  UIViewExtension.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/19.
//

import UIKit

extension UIView {
  
  func pinToEdges(constant: CGFloat = 0, inView superview: UIView) {
    self.translatesAutoresizingMaskIntoConstraints = false
    self.topAnchor.constraint(equalTo: superview.topAnchor, constant: constant).isActive = true
    self.bottomAnchor.constraint(equalTo: superview.bottomAnchor, constant: constant).isActive = true
    self.leadingAnchor.constraint(equalTo: superview.leadingAnchor, constant: constant).isActive = true
    self.trailingAnchor.constraint(equalTo: superview.trailingAnchor, constant: constant).isActive = true
  }
  
  func clearConstraints() {
    subviews.forEach { $0.clearConstraints() }
    self.removeConstraints(self.constraints)
  }
  
  func fullScreen(to other: UIView) {
    leadingAnchor.constraint(equalTo: other.leadingAnchor, constant: 0).isActive = true
    trailingAnchor.constraint(equalTo: other.trailingAnchor, constant: 0).isActive = true
    topAnchor.constraint(equalTo: other.topAnchor, constant: 0).isActive = true
    bottomAnchor.constraint(equalTo: other.bottomAnchor, constant: 0).isActive = true
  }
  
  func setShadow(color: UIColor, x: Int, y: Int, opacity: Int, radius: Int) {
    self.layer.shadowColor = color.cgColor
    self.layer.shadowOffset = CGSize(width: x, height: y)
    self.layer.shadowOpacity = Float(opacity)
    self.layer.shadowRadius = CGFloat(radius)
  }
  
  func setBolder(color: UIColor, width: Double) {
    self.layer.borderColor = color.cgColor
    self.layer.borderWidth = CGFloat(width)
  }
  
  func roundCorners(topLeft: CGFloat = 0, topRight: CGFloat = 0, bottomLeft: CGFloat = 0, bottomRight: CGFloat = 0) {
    let topLeftRadius = CGSize(width: topLeft, height: topLeft)
    let topRightRadius = CGSize(width: topRight, height: topRight)
    let bottomLeftRadius = CGSize(width: bottomLeft, height: bottomLeft)
    let bottomRightRadius = CGSize(width: bottomRight, height: bottomRight)
    let maskPath = UIBezierPath(shouldRoundRect: bounds, topLeftRadius: topLeftRadius, topRightRadius: topRightRadius, bottomLeftRadius: bottomLeftRadius, bottomRightRadius: bottomRightRadius)
    let shape = CAShapeLayer()
    shape.path = maskPath.cgPath
    layer.mask = shape
  }
}
