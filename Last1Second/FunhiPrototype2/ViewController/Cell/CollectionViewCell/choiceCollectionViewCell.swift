//
//  choiceCollectionViewCell.swift
//  FunhiPrototype2
//
//  Created by 손영웅 on 2021/01/10.
//

import UIKit

class choiceCollectionViewCell: UICollectionViewCell {
    @IBOutlet var choiceLabel: UILabel!
    
    @IBOutlet var choiceInCell: UIView!
    @IBOutlet weak var choiceCellShadowView: UIView!
    override func awakeFromNib() {
        choiceCellUIUpdate(target: choiceInCell)
        choiceInCell.bringSubviewToFront(choiceLabel)
        choiceCellShadowView.layer.cornerRadius = 22.41
        choiceLabel.font = UIFont(name: "NanumSquareB", size: 16)
        
    }
    
  
    func choiceUpdate(choiceText : String){
        choiceLabel.text = choiceText
    }
}
