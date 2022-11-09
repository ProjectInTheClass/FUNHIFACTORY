//
//  TutorialCell3.swift
//  FunhiPrototype2
//
//  Created by 최서연 on 2021/08/08.
//

import UIKit
import Gifu

class TutorialCell3: UICollectionViewCell {
  
  @IBOutlet weak var image: GIFImageView!
  @IBOutlet weak var desc: UILabel!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    desc.setLineSpacing(3)
  }
  
  func configureCell(image: String, desc: String) {
    self.image.animate(withGIFNamed: image)
    self.desc.text = desc
  }
}
