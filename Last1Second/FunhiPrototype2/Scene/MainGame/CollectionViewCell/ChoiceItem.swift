//
//  ChoiceItem.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/10.
//

import UIKit

class ChoiceItem: UICollectionViewCell {
  @IBOutlet var choiceLabel: UILabel!
  @IBOutlet var box: UIView!
  @IBOutlet weak var shadow: UIView!
  
  let radius = 22.41
  
  override func awakeFromNib() {
    updateStyle()
    updateLayout()
  }
    
  func choiceUpdate(choiceText: String) {
    choiceLabel.text = choiceText
  }
  
  private func updateLayout() {
    box.bringSubviewToFront(choiceLabel)
  }
  
  private func updateStyle() {
    shadow.layer.cornerRadius = radius
    box.layer.cornerRadius = radius
    box.translatesAutoresizingMaskIntoConstraints = false
  }
}
