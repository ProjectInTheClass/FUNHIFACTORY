//
//  TitleCoverTapLabel.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/10/17.
//

import UIKit

class TapAndStartLabel: UILabel {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    setupStyle()
  }
  
  private func setupStyle() {
    text = "탭하여 시작하기"
    font = UIFont(name: "NanumSquareR", size: 15)
    setCharacterSpacing(5)
    setShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 1), offsetX: 0, offsetY: 0, opacity: 1, radius: 5)
    translatesAutoresizingMaskIntoConstraints = false
    textAlignment = .center
    textColor = .white
    lineBreakMode = .byWordWrapping
  }
}
