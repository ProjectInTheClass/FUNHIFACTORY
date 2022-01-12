//
//  AudioLabel.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/10/17.
//

import UIKit

class AudioLabel: UILabel {
  
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
    text = "소리를 켜고 플레이해주세요!"
    font = UIFont(name: "NanumSquareEB", size: 15)
    setCharacterSpacing(5)
    setShadow(color: UIColor(red: 0, green: 0, blue: 0, alpha: 1), x: 0, y: 0, opacity: 1, radius: 5)
    translatesAutoresizingMaskIntoConstraints = false
    textAlignment = .center
    textColor = .white
    lineBreakMode = .byWordWrapping
  }
}
