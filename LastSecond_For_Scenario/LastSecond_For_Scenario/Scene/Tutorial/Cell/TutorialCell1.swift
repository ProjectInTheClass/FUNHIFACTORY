//
//  TutorialCell1.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/08.
//

import UIKit
import Gifu

class TutorialCell1: UICollectionViewCell {
  
  @IBOutlet weak var fillImage: GIFImageView!
  @IBOutlet weak var desc: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    desc.setLineSpacing(3)
  }
  
  func configureCell(image: String, desc: String) {
    fillImage.animate(withGIFNamed: image)
    self.desc.text = desc
  }
}

