//
//  AlertDescLabel.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import UIKit

class AlertDescLabel: UILabel {
  
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
    font = UIFont(name: "NanumSquareB", size: 16)
    setLineSpacing(6)
    textAlignment = .center
  }
}
