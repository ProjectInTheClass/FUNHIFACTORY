//
//  NotePopupView.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/19.
//

import UIKit

class NotePopupView: UIView {
  
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
    layer.cornerRadius = 7
    backgroundColor = UIColor(red: 0.834, green: 0.929, blue: 0.892, alpha: 1)
    setBolder(color: UIColor(red: 0.509, green: 0.721, blue: 0.638, alpha: 1), width: 5)
    setShadow(color: UIColor(red: 0.835, green: 0.929, blue: 0.894, alpha: 1), x: 0, y: 0, opacity: 1, radius: 4)
  }
}
