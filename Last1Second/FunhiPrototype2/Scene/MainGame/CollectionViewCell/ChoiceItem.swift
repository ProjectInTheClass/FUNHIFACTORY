//
//  ChoiceItem.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/10.
//

import UIKit

class ChoiceItem: UICollectionViewCell {
  @IBOutlet var choiceLabel: UILabel!
  @IBOutlet var choiceInCell: UIView!
  @IBOutlet weak var choiceCellShadowView: UIView!
  
  let radius = 22.41
  
  override func awakeFromNib() {
    updateStyle()
    updateLayout()
  }
    
  func choiceUpdate(choiceText: String) {
    choiceLabel.text = choiceText
  }
  
  private func updateLayout() {
    choiceInCell.bringSubviewToFront(choiceLabel)
  }
  
  private func updateStyle() {
    choiceCellShadowView.layer.cornerRadius = radius
    choiceInCell.layer.cornerRadius = radius
    choiceInCell.translatesAutoresizingMaskIntoConstraints = false
  }
}
