//
//  AlertBox.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import UIKit

class AlertBox: UIView {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    setupLayout()
    setupStyle()
  }
  
  private func setupLayout() {
    
  }
  
  private func setupStyle() {
    layer.cornerRadius = 20
    layer.borderWidth = 6
    layer.borderColor = UIColor(red:0.647, green: 0.737, blue: 0.812, alpha: 1).cgColor
    backgroundColor = .white
  }
}
