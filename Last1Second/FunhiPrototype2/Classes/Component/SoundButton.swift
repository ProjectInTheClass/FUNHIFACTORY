//
//  FFButton.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/10/17.
//

import UIKit

class SoundButton: UIButton {
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    commonInit()
  }
  
  required init?(coder: NSCoder) {
    super.init(coder: coder)
    commonInit()
  }
  
  private func commonInit() {
    setupSound()
  }
  
  private func setupSound() {
    addTarget(self, action: #selector(playSound), for: .touchUpInside)
  }
  
  @objc private func playSound() {
    playEffectSound(.buttonClick, type: .mp3)
  }
}
