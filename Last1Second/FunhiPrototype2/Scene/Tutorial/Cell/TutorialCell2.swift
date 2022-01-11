//
//  TutorialCell2.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/08.
//

import UIKit
import Gifu

class TutorialCell2: UICollectionViewCell {
  
  @IBOutlet weak var image1: GIFImageView!
  @IBOutlet weak var image2: GIFImageView!
  @IBOutlet weak var desc: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    desc.setLineSpacing(3)
  }
  
  func configureCell(image: String, image2: String, desc: String) {
    self.image1.animate(withGIFNamed: image)
    self.image2.animate(withGIFNamed: image2)
    self.desc.text = desc
  }
}
