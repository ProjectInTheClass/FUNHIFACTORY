//
//  CoverImageView.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/09/20.
//

import UIKit

class CoverImageView: UIImageView {
  
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
    let coverImage = UIImage(named: "cover image")
    image = coverImage
    contentMode = .scaleAspectFill
  }
}

